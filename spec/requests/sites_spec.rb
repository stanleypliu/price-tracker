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

  describe 'POST /sites' do 
    let(:site_params) { FactoryBot.attributes_for(:correct_site) }
    let(:post_request) { post '/sites', params: { site: site_params }, headers: headers }

    context 'when the site fails to save' do
      before do 
        FactoryBot.create(:correct_site)
        post_request
      end

      it 'returns the status code - unprocessable entity' do
        expect(parsed_body[:status]).to eq("unprocessable_entity")
      end

      it 'returns the error in the response' do 
        expect(parsed_body[:message]).to eq("That site's already present")
      end

      it 'returns the redirect link in the response' do 
        expect(parsed_body[:redirect_link]).to eq(new_site_path)
      end
    end

    context 'when trying to save a valid site not yet present' do 
      before { post_request }

      it 'returns the status code - created' do
        expect(parsed_body[:status]).to eq("created")
      end

      it 'returns the error in the response' do 
        expect(parsed_body[:message]).to eq("Site successfully added")
      end

      it 'returns the redirect link in the response' do 
        expect(parsed_body[:redirect_link]).to eq(sites_path)
      end
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
