from flask import Flask, request
from twilio.twiml.messaging_response import MessagingResponse

app = Flask(__name__)

@app.route("/sms", methods=['GET', 'POST'])
def sms_reply():
    # Get message body of incoming message
    body = request.values.get('Body', None)

    # Start Response
    resp = MessagingResponse()

    # Determine Correct Response
    if body == 'Y' or body == 'y':
        globals.access = 1
        resp.message("Access granted to R'Mailbox.")
        print(globals.access)
    elif body == 'N' or body == 'n':
        globals.access = 0
        resp.message("Access denied to R'Mailbox.")
    else:
        resp.message("Please respond with Y/y or N/n")

    return str(resp)

if __name__ == "__main__":
    app.run(debug=True)
