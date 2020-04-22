# Script to send out SMS message to a users phone. This utilizes the SMS API provided by Twilio.
from twilio.rest import Client

# TODO: Add credentials as environment variables to make secure http://twil.io/secure
account_sid = 'ACe80440f4e27ad45caf3d06326a09963a'
auth_token = 'df786a80c0ec0091ab96d292c1e01e23'

client = Client(account_sid, auth_token)

message = client.messages \
    .create(
        body="This is a test",
        from_='+12058329927',  # Twilio verified SMS number
        to='+18287126687'
    )

print(message.sid)
