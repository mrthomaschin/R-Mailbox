from raspberrypi_src.notifications import send_sms


def test_sendSMS_stub():
    message = "Request to open R'Mailbox: Reply with Y/y or N/n."
    expected_sid = 'SM87105da94bff44b999e4e6eb90d8eb6a'

    to = '+18287126687'
    from_ = '+12058329927'
    response = send_sms.sendSMS(to, from_, message)
    if send_sms.environment == 'dev':
        assert response == expected_sid
    else:
        assert send_sms.sendSMS(to, from_, message) is not None
