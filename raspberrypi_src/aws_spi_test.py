from flask import Flask
from flask_ask import Ask, statement
import RPi.GPIO as GPIO
import spidev
import time

app = Flask(__name__)
ask = Ask(app, '/')

# global variable, for aws
detected = 0


def createSPI(bus, device):
    spi = spidev.SpiDev()

    spi.open(bus, device)
    spi.max_speed_hz = 1000000
    spi.mode = 0
    return spi


@ask.intent('IRIntent')
def isMail():
    print('Getting IR sensor value')
    if(detected == 0):
        return statement('There is currently no mail')

    return statement('You have mail')


if __name__ == '__main__':

    atmegaSPI = createSPI(0, 0)

    # GPIO, for debugging purposes
    # Pin 21 is the bottom right pin, to the left of it is GND for easy hookup
    # GPIO.setmode(GPIO.BCM)
    # GPIO.setup(21, GPIO.OUT)

    try:
        # I dont know where to put this
        app.run(debug=True)

        while True:
            Send_Status = 0x10

            atmegaSPI.xfer([Send_Status])
            sensorValue = atmegaSPI.readbytes(1)[0]

            print(f'Current Sensor Status: {sensorValue}')

            if sensorValue == 0:
                detected = 0
            elif sensorValue == 1:
                detected = 1
            else:
                print("LED not 1 or 0")

            time.sleep(1)

    except KeyboardInterrupt:
        exit()
    finally:
        atmegaSPI.close()
        # GPIO.cleanup()
