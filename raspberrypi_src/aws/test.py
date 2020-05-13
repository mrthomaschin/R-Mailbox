from flask import Flask
from flask_ask import Ask, statement
import RPi.GPIO as GPIO
import time
 
app = Flask(__name__)
ask = Ask(app, '/')
 
@ask.intent('BlinkIntent')
def blink():
  print "LED on"
  GPIO.output(18, GPIO.HIGH)
  time.sleep(1)
  print "LED off"
  GPIO.output(18, GPIO.LOW)
  return statement('Blinky blink')
 
if __name__ == '__main__':
  try:
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(18, GPIO.OUT)
    app.run(debug=True)
  finally:
    GPIO.cleanup()