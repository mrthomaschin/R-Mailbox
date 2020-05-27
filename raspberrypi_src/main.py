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
		print('Unlocking door')

		#SPI Command to Atmega
		Unlock_Door = 0x20

		atmegaSPI.xfer([Unlock_Door])

		resp.message("Access granted to R'Mailbox.")
	elif body == 'N' or body == 'n':
		resp.message("Access denied to R'Mailbox.")
	else:
		resp.message("Please respond with Y/y or N/n")

	return str(resp)

@ask.intent('IRIntent')
def isMail():
	print('Getting IR sensor value')

	#SPI Command to Atmega
	Send_Status = 0x10

	atmegaSPI.xfer([Send_Status])
	sensorValue = atmegaSPI.readbytes(1)[0]

	print("Current Sensor Status: ", sensorValue)

	if sensorValue == 1:
    		return statement('You have mail')

	return statement('There is currently no mail')


if __name__ == '__main__':

	atmegaSPI = createSPI(0, 0)
	Process(target=app.run, kwargs=dict(debug=True)).start()
	Process(target=requestButton).start()
	atmegaSPI.close()
