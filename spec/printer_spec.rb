require 'printer'

describe Printer do

	let(:array){ [{date: DateTime.new(2001,2,3), credit: 5, debit: 0, balance: 10}] }
	subject(:printer){ described_class.new }

	let(:printout){ printer.printout(array) }

	context '#print' do

		it 'uses keys from the first hash in an array as headers' do
			match = printout =~ /date \|\| credit \|\| debit \|\| balance/
			expect(match).to eq 0
		end
		it 'adds the values from each hash to a new line on the printout' do
			row = printout.split("\n")[1]
			expect(row).to eq '02-03-2001 || 5.00 || || 10.00'
		end
	end

end