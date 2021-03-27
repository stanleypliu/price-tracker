require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do 
    let(:product) { FactoryBot.build(:product) }

    it 'won\'t save a product that already exists' do
      product.save
      FactoryBot.rewind_sequences
      new_product = FactoryBot.build(:product)

      expect(new_product).not_to be_valid
    end
  end
end
