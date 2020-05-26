# from unittest import mock
# import raspberrypi_src
# from raspberrypi_src.notifications import send_sms

# @mock.patch('raspberrypi_src.notifications.send_sms.client.messages.create')
# def test_sendSMS(create_message_mock):
#     message = "Request to open R'Mailbox: Reply with Y/y or N/n."
#     expected_sid = 'SM87105da94bff44b999e4e6eb90d8eb6a'
#     create_message_mock.return_value.sid = expected_sid

#     to = '+18287126687'
#     from_ = '+12058329927'
#     response = raspberrypi_src.notifications.send_sms.sendSMS(
#         to, from_, message)

#     assert create_message_mock.called is True
#     assert response == expected_sid
