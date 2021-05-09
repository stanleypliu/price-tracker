require 'rails_helper'

RSpec.describe InitialPopulatorJob, type: :job do
  let(:product) { FactoryBot.create(:static_product) }
  let(:fetched_id) { '24' }
  let(:google_search_service) { instance_double(AppServices::GoogleSearchService, call: fetched_id) }

  subject(:pass_product_id) { described_class.new.perform(product) }

  before { allow(AppServices::GoogleSearchService).to receive(:new).and_return(google_search_service) }

  describe '#perform_later' do
    it 'enqueues a job' do
      expect { described_class.perform_later }.to have_enqueued_job
    end

    it 'adds the Google Product ID to the site to be saved' do
      expect(google_search_service).to receive(:call)
      
      pass_product_id
    end

    it 'saves the site at the end' do     
      pass_product_id

      expect(product.google_product_id).to eq(fetched_id)
    end
  end
end
