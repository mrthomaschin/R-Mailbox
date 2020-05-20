from flask import Flask
from flask_ask import Ask, statement
import RPi.GPIO as GPIO
import spidev
import time

app = Flask(__name__)
ask = Ask(app, '/')


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

    print ("Current Sensor Status: ", sensorValue)

    atmegaSPI.close()

    if sensorValue == 1:
        return statement('You have mail')

    return statement('There is currently no mail')


if __name__ == '__main__':

    # GPIO, for debugging purposes
    # Pin 21 is the bottom right pin, to the left of it is GND for easy hookup
    # GPIO.setmode(GPIO.BCM)
    # GPIO.setup(21, GPIO.OUT)

    try:
        #atmegaSPI = createSPI(0, 0)
        app.run(debug=True)

    except KeyboardInterrupt:
        exit()
    # finally:
    #     # GPIO.cleanup()
