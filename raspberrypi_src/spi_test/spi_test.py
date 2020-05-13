import RPi.GPIO as GPIO
import spidev
import time

def createSPI(bus, device):
	spi = spidev.SpiDev()

	spi.open(bus, device)
	spi.max_speed_hz = 1000000
	spi.mode = 0;
	return spi

if __name__ == '__main__':

	atmegaSPI = createSPI(0, 0)

	#Pin 21 is the bottom right pin, to the left of it is GND for easy hookup
	GPIO.setmode(GPIO.BCM)
	GPIO.setup(21, GPIO.OUT)

	try:
		while True:
			#Command from RPi to request current sensor status
			Send_Status = 0x10

			atmegaSPI.xfer([Send_Status])
			sensorValue = atmegaSPI.readbytes(1)[0]

			print(f'Current Sensor Status: {sensorValue}')

			if sensorValue == 0:
				GPIO.output(21, GPIO.LOW)
			elif sensorValue == 1:
				GPIO.output(21, GPIO.HIGH)
			else:
				print("LED not 1 or 0")

			time.sleep(1)

	except KeyboardInterrupt:
		exit()
	finally:
		atmegaSPI.close()
		GPIO.cleanup()
