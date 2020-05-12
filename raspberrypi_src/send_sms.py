# Script to send out SMS message to a users phone. This utilizes the SMS API provided by Twilio.
from twilio.rest import Client
from settings import *

account_sid = TWILIO_SID
auth_token = TWILIO_AUTH

client = Client(account_sid, auth_token)

message = client.messages \
    .create(
        body="This is a test",
        from_='+12058329927',  # Twilio verified SMS number
        to='+18287126687'
    )

print(message.sid)
