from flask import Flask
from flask_ask import Ask, statement
import RPi.GPIO as GPIO
import time
 
app = Flask(__name__)
ask = Ask(app, '/')
 
@ask.intent('BlinkIntent')
def blink():
  print "LED on"
  GPIO.output(21, GPIO.HIGH)
  time.sleep(1)
  print "LED off"
  GPIO.output(21, GPIO.LOW)
  return statement('Flashing Light on R mailbox')
 
if __name__ == '__main__':
  try:
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(21, GPIO.OUT)
    app.run(debug=True)
  finally:
    GPIO.cleanup()
