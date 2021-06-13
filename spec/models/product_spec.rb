require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { FactoryBot.build(:product, amazon_product_id: nil) }

  describe 'validations' do 
    it 'won\'t save a product that already exists' do
      product.save
      FactoryBot.rewind_sequences
      new_product = FactoryBot.build(:product)

      expect(new_product).not_to be_valid
    end
    
    let(:blank_name_product) { FactoryBot.build(:blank_name_product) }

    it 'must not have a blank name' do
      expect(blank_name_product).not_to be_valid
    end
  end

  context 'when a new product has been added' do    
    it 'enqueues an InitialPopulatorJob' do 
      expect { product.save }.to have_enqueued_job(InitialPopulatorJob).with(product)
    end
  end
end
