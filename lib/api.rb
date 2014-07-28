require 'rubygems'
require 'twilio-ruby'
require './lib/engine'

def api
	puts "A message with the time of the delivery has been sent to your phone"

	account_sid = "AC01cccea712069c1fd2c9225af8616dd3"
	auth_token = "945dbfa540c4679b809fca9f330ed070"
	client = Twilio::REST::Client.new account_sid, auth_token
	 
	from = "+441584322016" # Your Twilio number

	friends = {
	"#{@customer_phone}" => "#{@customer_name}"
	}
	friends.each do |key, value|
	  client.account.messages.create(
	    :from => from,
	    :to => key,
	    :body => "Hey #{value}, your order will be delivered at #{time_for_delivery} , if we are late  the next order will be delivered by a strip teaser, the total amount is #{@order.final_bill} € "
	  ) 
	  puts "Sent message to #{value}"
	end
end

def time_for_delivery
		time = Time.now+(3600)
		time.to_s.split(' ')[1] 
end

