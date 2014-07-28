require 'engine'

describe 'Engine' do
	
	let(:e) { Engine.new }

	it 'take the input name of the user' do
		allow(e.ask_name).to receive(:gets).and_return("bob")
		expect(e).to receive(:puts).with("your name")
		e.ask_name
	end

	it 'take the input phone of the user' do
		allow(e.ask_phone).to receive(:gets)
	end

	it 'raise an error if the item is 	not in the menu' do 
		e.item = "bibibi"
		expect{ e.ask_choices }.to raise_error(RuntimeError)
	end
	
end