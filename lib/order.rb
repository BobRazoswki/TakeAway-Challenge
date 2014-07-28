require './lib/menu'
class Order

	attr_accessor :order, :menu, :quantity, :item, :price

	def initialize
		@menu = Menu.new
		@order = []
		@order_total = 0
	end

	def take_order_with(item, price, quantity)
		quantity.times { add_item_to_menu(item, price) } 
	end

	def add_item_to_menu(item, price)
		order_hash = {item => price}
		@order << order_hash
	end

	def final_bill
		@order_total = @order.map {|hashes| hashes.values}.flatten.inject(:+)
		@order_total
	end

end