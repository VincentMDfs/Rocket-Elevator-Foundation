#require 'twilio-ruby'
#
#
#account_sid = 'ACd4d1627f78308423e5782063600a4eaf'
#auth_token = 'fee719c96a0f9652772300ef1856d580'
#
## set up a client to talk to the Twilio REST API
#@client = Twilio::REST::Client.new account_sid, auth_token
#
#
#message = @client.messages.create(
#    body: "Hello from Ruby",
#    to: "+15819992357",    # Replace with your phone number
#    from: "+15005550006")  # Use this Magic Number for creating SMS
#
#puts message.sid