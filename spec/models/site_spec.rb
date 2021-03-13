require 'rails_helper'

RSpec.describe Site, type: :model do
  describe 'validations' do
    let(:site) { FactoryBot.build(:correct_site) }

    it 'saves a site with correct attributes' do 
      expect(site).to be_valid
    end

    context 'before submission' do 
      before { site.save }

      let (:invalid_site) { FactoryBot.build(:invalid_site) }
      let (:second_site) { FactoryBot.build(:correct_site) }

      it 'must have a valid URL' do 
        invalid_site.save
        expect(invalid_site).not_to be_valid
      end

      it 'should not be a duplicate' do 
        second_site.save
        expect(second_site).not_to be_valid
      end
    end
  end
end
