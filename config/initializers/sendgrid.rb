require 'sendgrid-ruby'
include SendGrid
SendGrid::API.new(api_key: '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')
SendGrid::API_KEY = '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'
# Initialize the SendGrid client
 #client = SendGrid::Client.new(api_key: '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')

# Set the default from email address
from = SendGrid::Email.new(email: 'itzvijaypatidar@gmail.com')
