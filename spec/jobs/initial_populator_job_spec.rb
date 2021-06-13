require 'rails_helper'

RSpec.describe InitialPopulatorJob, type: :job do
  let(:product) { FactoryBot.create(:static_product) }
  let(:fetched_id) { '24' }
  let(:amazon_search_service) { instance_double(AppServices::AmazonSearchService, call: fetched_id) }

  subject(:pass_product_id) { described_class.new.perform(product) }

  before { allow(AppServices::AmazonSearchService).to receive(:new).and_return(amazon_search_service) }

  describe '#perform_later' do
    it 'enqueues a job' do
      expect { described_class.perform_later }.to have_enqueued_job
    end

    it 'adds the Amazon ID to the site to be saved' do
      expect(amazon_search_service).to receive(:call)
      
      pass_product_id
    end

    it 'saves the site at the end' do     
      pass_product_id

      expect(product.amazon_product_id).to eq(fetched_id)
    end
  end
end
