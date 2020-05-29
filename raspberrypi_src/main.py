from flask import Flask, request
from multiprocessing import Process
import RPi.GPIO as GPIO

#Alexa
from flask_ask import Ask, statement
import spidev
import time

#Twilio
from twilio.twiml.messaging_response import MessagingResponse
from notifications import send_sms

# for testing purposes
def default(a, b):
    return a + b

def createSPI(bus, device):
    spi = spidev.SpiDev()

    spi.open(bus, device)
    spi.max_speed_hz = 1000000
    spi.mode = 0
    return spi

def requestButton():
	GPIO.setwarnings(False)
	GPIO.setmode(GPIO.BCM)
	GPIO.setup(21, GPIO.IN, pull_up_down=GPIO.PUD_UP)
	while (True):
		input = GPIO.input(21)
		if input == False:
			print("Button Pressed")
			send_sms.sendSMS('+19098272197', '+12058329927', "Request to open R'Mailbox: Reply with Y/y or N/n.")
		time.sleep(1)

def packageNotify():
	mailNotification = 1
	while (True):
		atmegaSPI = createSPI(0, 0)

		#SPI Command to Atmega
		Send_Status = 0x10

		atmegaSPI.xfer([Send_Status])
		isPackage = atmegaSPI.readbytes(1)[0]
		print("Package Status", isPackage)

		atmegaSPI.close()

		if isPackage:
			print("Package detected")
			if mailNotification == 1:
				mailNotification = 0
				print("Sending package notification")
				#send_sms.sendSMS('+19098272197', '+12058329927', "You have received a new package! The RMailbox will keep it safe until you retrieve it.")
		elif not isPackage:
			print("No package")
			if mailNotification != 1:
				mailNotification = 1
		else:
			print("Unknown signal")

		time.sleep(2)


app = Flask(__name__)
ask = Ask(app, '/')

@app.route("/sms", methods=['GET', 'POST'])
def sms_reply():
	# Get message body of incoming message
	body = request.values.get('Body', None)

	# Start Response
	resp = MessagingResponse()

	# Determine Correct Response
	if body == 'Y' or body == 'y':
		atmegaSPI = createSPI(0, 0)
		print('Unlocking door')

		#SPI Command to Atmega
		Unlock_Door = 0x20

		atmegaSPI.xfer([Unlock_Door])
		atmegaResponse = atmegaSPI.readbytes(1)[0]
		print(hex(atmegaResponse))

		atmegaSPI.close()

		resp.message("Access granted to R'Mailbox.")
	elif body == 'N' or body == 'n':
		resp.message("Access denied to R'Mailbox.")
	else:
		resp.message("Please respond with Y/y or N/n")

	return str(resp)

@ask.intent('IRIntent')
def isMail():
	atmegaSPI = creatSPI(0, 0)

	#SPI Command to Atmega
	Send_Status = 0x10

	atmegaSPI.xfer([Send_Status])
	isPackage = atmegaSPI.readbytes(1)[0]

	print("Current Package Status: ", isPackage)

	atmegaSPI.close()

	if isPackage:
    		return statement('You have mail')

	return statement('There is currently no mail')


if __name__ == '__main__':
	try:

		flaskServer = Process(target=app.run, kwargs=dict(debug=True))
		requestOpen = Process(target=requestButton)
		#notifications = Process(target=packageNotify)

		#http://jhshi.me/2015/12/27/handle-keyboardinterrupt-in-python-multiprocessing/index.html#.XtBUiDpKj-g
		#Fixes errors on keyboard interrupts
		flaskServer.daemon = True
		requestOpen.daemon = True
		#notifications.daemon = True

		flaskServer.start()
		requestOpen.start()
		#notifications.start()
		notifications = packageNotify()

	except KeyboardInterrupt:
		flaskServer.terminate()
		requestOpen.terminate()
		#notifications.terminate()
		exit()


