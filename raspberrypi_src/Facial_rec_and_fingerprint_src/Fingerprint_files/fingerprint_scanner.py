"""
PyFingerprint
Copyright (C) 2015 Bastian Raschke <bastian.raschke@posteo.de>
All rights reserved.

"""
import numpy as np
import time
from pyfingerprint.pyfingerprint import PyFingerprint


try:
    f = PyFingerprint('/dev/ttyAMA0', 57600, 0xFFFFFFFF, 0x00000000)

    if ( f.verifyPassword() == False ):
        raise ValueError('The given fingerprint sensor password is wrong!')

except Exception as e:
    print('The fingerprint sensor could not be initialized!')
    print('Exception message: ' + str(e))
    exit(1)


option = 1
while(option != 0):
    option = int(input("Enter 1 to enroll fingerprint, 2 to authenticate, 0 to quit: "))
    
    if option == 1:
    #enroll new finger
        try:
            print('Waiting for finger...')
            while ( f.readImage() == False ):
                pass
            f.convertImage(0x01)
        #Checks if finger is already enrolled
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
        #Compares
            if ( f.compareCharacteristics() == 0 ):
                raise Exception('Fingers do not match')
            f.createTemplate()
            positionNumber = f.storeTemplate()
            print('Finger enrolled successfully!')

        except Exception as e:
            print('Operation failed!')
            print('Exception message: ' + str(e))
            #exit(1)

    if option == 2:
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
            else:
                print("Noah Jimenez Authenticated B)")
            
                        
        except Exception as e:
            print('Operation failed!')
            print('Exception message: ' + str(e))
        
