require 'log'

describe Log do

	let(:deposit){ double(:transaction, date: :dummy_date, amount: 5)}
	let(:withdrawal){ double(:transaction, date: :dummy_date, amount: -5)}
	
	let(:balance_now){ 10 }

	subject(:log){ described_class.new }

	context '#store' do
		
		it 'adds a hash to the logged array with all the deposit details passed in' do
			log.store(deposit,balance_now)
			expect(log.show).to eq [{date: :dummy_date, credit: 5, debit: 0, balance: balance_now}]
		end

		it 'adds a hash to the logged array with all the withdrawal details passed in' do
			log.store(withdrawal,balance_now)
			expect(log.show).to eq [{date: :dummy_date, credit: 0, debit: 5, balance: balance_now}]
		end

	end

end