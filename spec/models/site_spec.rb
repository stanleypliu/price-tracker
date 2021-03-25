require 'rails_helper'

RSpec.describe Site, type: :model do
  describe 'validations' do
    let(:site) { FactoryBot.build(:correct_site) }

    it 'saves a site with correct attributes' do 
      expect(site).to be_valid
    end

    context 'before submission' do 
      before { site.save }

      let (:invalid_url_site) { FactoryBot.build(:invalid_url_site) }
      let (:blank_name_site) { FactoryBot.build(:blank_name_site) }
      let (:second_site) { FactoryBot.build(:correct_site) }

      it 'must have a valid URL' do 
        invalid_url_site.save
        expect(invalid_url_site).not_to be_valid
      end

      it 'must not have a blank name' do 
        blank_name_site.save
        expect(blank_name_site).not_to be_valid
      end

      it 'must not be a duplicate' do 
        second_site.save
        expect(second_site).not_to be_valid
      end
    end
  end
end
