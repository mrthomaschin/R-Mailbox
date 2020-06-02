import os
from sendgrid import SendGridAPIClient
from sendgrid.helpers.mail import Mail

def sendEmail(body):
	message = Mail(
    		from_email='jhalv001@ucr.edu',
    		to_emails='jhalvorson6687@gmail.com',
    		subject='RMailbox Package Notification ',
    		html_content= body)
	try:
    		sg = SendGridAPIClient(os.environ.get('SENDGRID_API_KEY'))
    		response = sg.send(message)
    		print(response.status_code, response.body, response.headers)
	except Exception as e:
    		print(e)
