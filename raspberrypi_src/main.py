from flask import Flask, request
import RPi.GPIO as GPIO

#Alexa
from flask_ask import Ask, statement
import spidev
import time

#Twilio
from twilio.twiml.messaging_response import MessagingResponse
# from notifications import send_sms
from .notifications import send_sms

access = 0


def test():
    GPIO.setwarnings(False)
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(21, GPIO.IN, pull_up_down=GPIO.PUD_UP)
    GPIO.setup(20, GPIO.OUT)
    while (True):
        input = GPIO.input(21)
        if input == False:
            print("Button Pressed")
            send_sms.sendSMS(
                '+19098272197', '+12058329927',
                "Request to open R'Mailbox: Reply with Y/y or N/n.")
            print(access)

        if access == 1:
            GPIO.output(20, 1)
            print("Door Opened")

        elif access == 0:
            GPIO.output(20, 0)


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
        access = 1
        resp.message("Access granted to R'Mailbox.")
    elif body == 'N' or body == 'n':
        access = 0
        resp.message("Access denied to R'Mailbox.")
    else:
        resp.message("Please respond with Y/y or N/n")

    return str(resp)


# for testing purposes
def default(a, b):
    return a + b


def createSPI(bus, device):
    spi = spidev.SpiDev()

    spi.open(bus, device)
    spi.max_speed_hz = 1000000
    spi.mode = 0
    return spi


@ask.intent('IRIntent')
def isMail():
    atmegaSPI = createSPI(0, 0)
    print('Getting IR sensor value')

    Send_Status = 0x10

    atmegaSPI.xfer([Send_Status])
    sensorValue = atmegaSPI.readbytes(1)[0]

    print("Current Sensor Status: ", sensorValue)

    atmegaSPI.close()

    if sensorValue == 1:
        return statement('You have mail')

    return statement('There is currently no mail')


#if __name__ == '__main__':

# GPIO, for debugging purposes
# Pin 21 is the bottom right pin, to the left of it is GND for easy hookup
# GPIO.setmode(GPIO.BCM)
# GPIO.setup(21, GPIO.OUT)

#try:
#atmegaSPI = createSPI(0, 0)

#app.run(debug=True)

#except KeyboardInterrupt:
# exit()
# finally:
#     # GPIO.cleanup()
if __name__ == "__main__":
    app.run(debug=True)