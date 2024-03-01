# config/initializers/twilio.rb
require 'twilio-ruby'

account_sid = 'ACe1296916733ff8ce775cb1c89dddb845'
auth_token = '67587d13fb597f63f2bdb8018c0a35e3'

$twilio_client = Twilio::REST::Client.new(account_sid, auth_token)

Rails.logger.info("Twilio client initialized successfully.") if $twilio_client
