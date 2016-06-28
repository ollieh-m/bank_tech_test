require 'printer'

describe Printer do

	let(:deposit){ double(:deposit, date: DateTime.new(2001,2,3), amount: 5) }
	let(:withdrawal){ double(:withdrawal, date: DateTime.new(2001,2,3), amount: -5) }

	let(:array){ [{transaction: deposit, balance: 10},
								{transaction: withdrawal, balance: 10}] }
	subject(:printer){ described_class.new }

	let(:printout){ printer.printout(array) }

	context '#reformat' do

		it 'creates a new array of hashes with the correct keys and values' do
			array = printer.reformat(array)
			expect(array).to eq [{date: '03-02-2001', credit: '5.00', debit: '', balance: '10.00'},
													 {date: '03-02-2001', credit: '', debit: '5.00', balance: '10.00'}]
		end

	end


	# 	it 'uses keys from the first hash in an array as headers' do
	# 		match = printout =~ /date \|\| credit \|\| debit \|\| balance/
	# 		expect(match).to eq 0
	# 	end

	# 	it 'adds the values from the first hash to a new line on the printout' do
	# 		row = printout.split("\n")[1]
	# 		expect(row).to eq '03-02-2001 || 5.00 || || 10.00'
	# 	end
	# 	it 'adds the values from the second hash to a new line on the printout' do
	# 		row = printout.split("\n")[2]
	# 		expect(row).to eq '04-02-2001 || || 5.00 || 10.00'
	# 	end
	# end

end