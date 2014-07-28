require 'order'

describe 'order' do 

	let(:order) { Order.new }
	let(:menu)  { Menu.new  }

	it 'the order cart is an array' do
		expect(order.order).to eq []
	end

	it 'you can put items in the order cart' do
		item = "chicken"
		price = 8
		order.add_item_to_menu(item, price)
		expect(order.order).to include({"chicken" => 8})
	end

	it 'can multiple by the desired quantity' do
		item = "chicken"
		price = 8
		quantity = 3
		order.take_order_with(item, price, quantity)
		expect(order.order).to include({"chicken" => 8}, {"chicken" => 8}, {"chicken" => 8})
	end

	it 'can calcul the final bill' do
		item = "chicken"
		price = 8
		quantity = 3
		#order.add_item_to_menu(item, price)
		order.take_order_with(item, price, quantity)
		expect(order.final_bill).to eq 24
	end
	
end