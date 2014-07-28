require './lib/order'
require './lib/api'

class Engine

	def initialize
		@customer_name = ask_name
		@customer_phone = ask_phone
		@order = Order.new
		@loop = loopy
	end

	def loopy
		salutation
		while !@customer_name.empty? do
			ask_choices
			price = ask_prices(@item)
			quantity = ask_quantities
			@order.take_order_with(@item, price, quantity)
			print_total_bill
			ask_customer_confirmation
		end
	end

private

	def ask_name
		puts "your name"
		gets.chomp.downcase
	end

	def ask_phone
		puts "your phone"
		gets.chomp.to_i
	end

	def salutation
		puts "Hello #{@customer_name} and welcome to Alex's Restaurant"
	end

	def ask_choices
		puts "what do you want to eat"
		puts "Dishes: #{Menu.new.menu.keys} Pricese: #{Menu.new.menu.values}"
		puts "the name of your order"
		@item = gets.chomp
		raise "#{@customer_name} !! put something that is in the menu" unless  Menu.new.menu.keys.include? @item
	end

	def ask_prices(item)
		price = Menu.new.menu.values_at(item)
	end

	def ask_quantities
		puts "the quantity of your order"
		quantity = gets.chomp.to_i
	end

	def print_total_bill
		puts "the total bill is #{@order.final_bill}"
		puts "do you want to pay bitch?"
		puts "Say yes or no"
	end

	def customer_input
		gets.chomp
	end

	def ask_customer_confirmation
		if customer_input == "yes"
			api
			exit
		else
			puts "You will be out"
			exit
		end
	end

end