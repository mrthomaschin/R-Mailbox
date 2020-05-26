# Script to send out SMS message to a users phone. This utilizes the SMS API provided by Twilio.
from twilio.rest import Client
from twilio.base.exceptions import TwilioRestException
# from .notifications.settings import *
from .settings import *
import logging

account_sid = TWILIO_SID
auth_token = TWILIO_AUTH

client = Client(account_sid, auth_token)


def sendSMS(to, from_, message):
    try:
        sent_message = client.messages \
            .create(
                body=message,
                from_=from_,  # Twilio verified SMS number
                to=to
            )
    except TwilioRestException as e:
        logging.error(f'Error: {e}')
        return
    return sent_message.sid
