require 'menu'

describe 'Menu' do
	
	it 'should have a hash menu' do
		menu = Menu.new
		expect(menu.menu.is_a?(Hash)).to be true
	end


end