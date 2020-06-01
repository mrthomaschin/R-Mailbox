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
from notifications import send_email

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
	#FLAGS
	#1 = Send message, 0 = We already sent
	sendNotification = 1
	#0 = Not outgoing, 1 = Package needs pickup
	isOutgoing = 0

	while (True):
		atmegaSPI = createSPI(0, 0)

		#SPI Command to Atmega
		Send_Status = 0x10

		atmegaSPI.xfer([Send_Status])
		#Atmega can return 4 possible values: 0 for no package, 1 for package delivered, 2 for package is outgoing, 3 for something detected while door is unlocked
		isPackage = atmegaSPI.readbytes(1)[0]

		atmegaSPI.close()

		#Standard Delivery
		if isPackage == 1:
			print("Package detected")
			if sendNotification == 1:
				print("Sending package notification")
				send_sms.sendSMS('+19098272197', '+12058329927', "You have received a new package! The RMailbox will keep it safe until you retrieve it.")
				send_email.sendEmail('You have received a new package! The RMailbox will keep it safe until you retrieve it.')
				sendNotification = 0

		#Package is outgoing
		elif isPackage == 2:
			print("Package awaiting pickup")
			if not isOutgoing:
				isOutgoing = 1

		#No package detected
		elif isPackage == 0:
			print("No package")
			if isOutgoing:
				print("Sending pickup notification")
				isOutgoing = 0;
				send_sms.sendSMS('+19098272197', '+12058329927', "Your package has been picked up! Thank you for using Rmailbox.")
				send_email.sendEmail('Your package has been picked up! Thank you for using Rmailbox.')
				sendNotifications = 0
			else:
				#If there's no package, we reset and send notifications the next time something happens
				if not sendNotification:
					sendNotification == 1
		else:
			print("Door unlocked, package inside")

		time.sleep(3)


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

@ask.intent('deliveryIntent')
def isMail():
	atmegaSPI = createSPI(0, 0)

	#SPI Command to Atmega
	Send_Status = 0x10

	atmegaSPI.xfer([Send_Status])
	isPackage = atmegaSPI.readbytes(1)[0]

	print("Current Package Status: ", isPackage)

	atmegaSPI.close()

	if isPackage == 1:
		return statement('You have mail')

	return statement('There is currently no mail')

@ask.intent('pickupIntent')
def pickupStatus():
	atmegaSPI = createSPI(0, 0)

	#SPI Command to Atmega
	Send_Status = 0x10

	atmegaSPI.xfer([Send_Status])
	pickupStatus = atmegaSPI.readbytes(1)[0]

	print("Current Pickup Status: ", pickupStatus)

	atmegaSPI.close()

	if pickupStatus == 2:
		return statement('Your package has not been picked up yet')

	return statement('Your package has been picked up')

if __name__ == '__main__':
	try:

		requestOpen = Process(target=requestButton)
		notifications = Process(target=packageNotify)

		#http://jhshi.me/2015/12/27/handle-keyboardinterrupt-in-python-multiprocessing/index.html#.XtBUiDpKj-g
		#Fixes errors on keyboard interrupts
		requestOpen.daemon = True
		notifications.daemon = True

		requestOpen.start()
		notifications.start()
		app.run()

	except KeyboardInterrupt:
		requestOpen.terminate()
		notifications.terminate()
		GPIO.cleanup()
		exit()