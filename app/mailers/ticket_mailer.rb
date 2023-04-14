class TicketMailer < ApplicationMailer
  def send_email
    from = SendGrid::Email.new(email: "itzvijaypatidar@gmail.com")
    to = SendGrid::Email.new(email: "patidarvijay590@gmail.com")
    subject = "Testing Email"
    content = SendGrid::Content.new(type: "text/plain", value: "This is a test email.")
    mail = SendGrid::Mail.new(from, subject, to, content)
  end
end
