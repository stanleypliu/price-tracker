RSpec.describe AppServices::GoogleShoppingService do 
  let(:name) { 'product 1' }
  let(:service) { described_class.new(name: name) }

  describe '#call' do 
    before { service.call }

    it 'makes a request to the Google Shopping Results API' do 
      pending ''
    end

    it 'returns the correct ID' do 
      expect(service.call).to eq(42)
    end
  end
end