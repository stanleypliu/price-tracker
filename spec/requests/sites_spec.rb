require 'rails_helper'

RSpec.describe "Sites", type: :request do
  let(:headers) { { "Accept": "application/json" } }
  let(:site) { 
    FactoryBot.create(:correct_site) do |correct_site| 
      FactoryBot.create_list(:product, 4, sites: [correct_site]) 
    end
  }

  describe "GET /sites" do
    it 'gets the index page' do
      get '/sites'

      expect(response).to be_successful
      expect(response.content_type).to eq("text/html; charset=utf-8")
    end
  end

  context 'when the request wants JSON' do 
    let(:sites) { 
      FactoryBot.build_list(:site, 4) do |site, i|
        name = "site#{i}"
        site.name = name
        site.url = "https://www.#{name}.com"
      end
    }

    before { sites.map(&:save) }

    it 'returns a list of all sites as a JSON' do 
      get '/sites', headers: headers

      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response.body).to eq(sites.to_json)
    end
  end

  describe 'GET /sites/new' do
    it 'gets the new site page' do 
      get '/sites/new' 

      expect(response).to be_successful 
    end
  end

  describe 'GET /sites/:id' do
    it 'displays the show page for a site' do
      get "/sites/#{site.id}"

      expect(response).to be_successful
      expect(response.content_type).to eq("text/html; charset=utf-8")
    end

    context 'when the request wants JSON' do 
      it 'returns the site as a JSON' do
        get "/sites/#{site.id}", headers: headers

        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(response.body).to eq(site.to_json)
      end
    end
  end

  describe 'GET /sites/:id/products' do     
    it 'fetches the product count for the given site' do
      get "/sites/#{site.id}/products", headers: headers 

      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response.body).to eq({ "productCount": site.products.count }.to_json)
    end 
  end
end
