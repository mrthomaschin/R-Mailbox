#/bin/env python
# -*- coding: utf-8 -*-

import face_recognition
import picamera
import numpy as np
import time
from pyfingerprint.pyfingerprint import PyFingerprint
import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(20, GPIO.OUT)
GPIO.setup(21, GPIO.OUT)
GPIO.setup(13, GPIO.IN)
GPIO.setup(19, GPIO.IN)
GPIO.setup(26, GPIO.IN)
GPIO.output(20, GPIO.LOW)
GPIO.output(21, GPIO.LOW)
#Initialize the fingerprint scanner
try:
    f = PyFingerprint('/dev/ttyAMA0', 57600, 0xFFFFFFFF, 0x00000000)

    if ( f.verifyPassword() == False ):
        raise ValueError('The given fingerprint sensor password is wrong!')

except Exception as e:
    print('The fingerprint sensor could not be initialized!')
    print('Exception message: ' + str(e))
    exit(1)

camera = picamera.PiCamera()
camera.resolution = (320, 240)
output = np.empty((240, 320, 3), dtype=np.uint8)

# Load a sample picture and learn how to recognize it.
noah_image = face_recognition.load_image_file("noah3.jpg")
noah_face_encoding = face_recognition.face_encodings(noah_image)[0]


face_locations = []
face_encodings = []

failures = 0

option = 1
while(option):
    if GPIO.input(13):
        try:
            if f.getTemplateCount() != 0:
                print('You must first verify with a known finger...')
                while ( f.readImage() == False ):
                    pass
                f.convertImage(0x01)
                result = f.searchTemplate()
                positionNumber = result[0]
                accuracyScore = result[1]
                if (positionNumber == -1):
                    print('Fingerprint did not match!')
                else:
                    print('Now to register a new finger!')
                    time.sleep(1)
                    print('Waiting for finger...')
                    while ( f.readImage() == False ):
                        pass
                    f.convertImage(0x01)
                    result = f.searchTemplate()
                    positionNumber = result[0]
                    if ( positionNumber >= 0 ):
                        print('Template already exists!') 
                        continue
                    print('Remove finger...')
                    time.sleep(2)
                    print('Waiting for same finger again...')
                    while ( f.readImage() == False ):
                        pass
                    f.convertImage(0x02)
                    if ( f.compareCharacteristics() == 0 ):
                        raise Exception('Fingers do not match')
                    f.createTemplate()
                    positionNumber = f.storeTemplate()
                    print('Finger enrolled successfully!')
            else:
                print('Waiting for finger...')
                while ( f.readImage() == False ):
                    pass
                f.convertImage(0x01)
                result = f.searchTemplate()
                positionNumber = result[0]
                if ( positionNumber >= 0 ):
                    print('Template already exists!') 
                    continue
                print('Remove finger...')
                time.sleep(2)
                print('Waiting for same finger again...')
                while ( f.readImage() == False ):
                    pass
                f.convertImage(0x02)
                if ( f.compareCharacteristics() == 0 ):
                    raise Exception('Fingers do not match')
                f.createTemplate()
                positionNumber = f.storeTemplate()
                print('Finger enrolled successfully!')

        
        
        except Exception as e:
            print('Operation failed!')
            print('Exception message: ' + str(e))

    if GPIO.input(19):
        try:
            print('Waiting for finger...')
            while ( f.readImage() == False ):
                pass
            f.convertImage(0x01)
            result = f.searchTemplate()
            positionNumber = result[0]
            accuracyScore = result[1]
            if (positionNumber == -1):
                print('Fingerprint did not match!')
                failures = failures + 1
                if failures >= 3:
                    print('Warning! over 3 failures! ALARM')
                    GPIO.output(21, GPIO.HIGH)
                    time.sleep(3)
                    GPIO.output(21, GPIO.LOW)
     
            else:
                print('Unlocked!')
                GPIO.output(20, GPIO.HIGH)
                time.sleep(3)
                GPIO.output(20, GPIO.LOW)
                failures = 0

        except Exception as e:
            print('Operation failed!')
            print('Exception message: ' + str(e))
        

    if GPIO.input(26):
        try:
            print("Capturing image.")
            camera.capture(output, format="rgb")

            face_locations = face_recognition.face_locations(output)
            face_encodings = face_recognition.face_encodings(output, face_locations)

            for face_encoding in face_encodings:
                match = face_recognition.compare_faces([noah_face_encoding], face_encoding) 
                name = "Unauthorized Person!"
                
                if match[0]:
                    name = "Noah Jimenez is on Camera"
                    print(name)
                    print('Unlocked!')
                    GPIO.output(20, GPIO.HIGH)
                    time.sleep(3)
                    GPIO.output(20, GPIO.LOW)
                    failures = 0
                else:
                    print(name)
                    failures = failures + 1
                    if failures >= 3:
                        print('Warning! over 3 failures! ALARM')
                        GPIO.output(21, GPIO.HIGH)
                        time.sleep(3)
                        GPIO.output(21, GPIO.LOW)
                    
            
        except Exception as e:
            print('Operation failed!')
            print('Exception message: ' + str(e))
        

       
        

