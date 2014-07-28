require 'api'

describe 'Api' do
	

	it 'print the an hour more ' do
		time = Time.now
		expect(time_for_delivery).to eq "21:03:00" 
		time_for_delivery
	end

end