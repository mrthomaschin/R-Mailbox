from notifications import send_sms
#import RPi.GPIO as GPIO
from run import access

#GPIO.setwarnings(False)
#GPIO.setmode(GPIO.BOARD)
#GPIO.setup(23, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
#GPIO.setup(24, GPIO.OUT)
send_sms.sendSMS()
#while (True):
#if GPIO.input(23) == GPIO.HIGH:

#   if access == 1:
#GPIO.output(24, 1)
#       print("Door Opened")

#   if access == 0:
#GPIO.output(24, 0)
#       print("Door Closed")