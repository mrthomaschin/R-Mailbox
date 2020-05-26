# Script to send out SMS message to a users phone. This utilizes the SMS API provided by Twilio.
from collections import namedtuple
import os
from twilio.rest import Client
from twilio.base.exceptions import TwilioRestException
import logging

environment = os.getenv('ENVIRONMENT', 'dev')


# Fake client class to be used for unit testing during development, change environment to
# something other than 'dev' to test real API call
class FakeClient:
    def __init__(self, **kwargs):
        self.messages = self.MessageFactory()

    class MessageFactory:
        @staticmethod
        def create(**kwargs):
            Message = namedtuple("Message", ['sid'])
            message = Message(sid="SM87105da94bff44b999e4e6eb90d8eb6a")
            return message


if environment == 'dev':
    client = FakeClient()
else:
    account_sid = os.environ['TWILIO_ACCOUNT_SID']
    auth_token = os.environ['TWILIO_AUTH_TOKEN']
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
        # logging.error(f'Error: {e}\\')
        logging.error(f'Error: \\')
        return
    return sent_message.sid
