from flask import Flask, request
from twilio.twiml.messaging_response import MessagingResponse

app = Flask(__name__)

@app.route("/sms", methods=['GET', 'POST'])
def sms_reply():
    """Respond to incoming with a friendly SMS."""
    # Start Response
    resp = MessagingResponse()

    # Add Message
    resp.message("Ahoy! Thanks so much for your message.")
    return str(resp)

if __name__ == "__main__":
    app.run(debug=True)