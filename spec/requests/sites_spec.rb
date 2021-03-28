require 'rails_helper'

RSpec.describe "Sites", type: :request do
  let(:headers) { { "Accept": "application/json" } }

  describe "GET /sites" do
    it 'gets the index page' do
      get '/sites'

      expect(response).to be_successful
      expect(response.content_type).to eq("text/html; charset=utf-8")
    end

    context 'when the request wants JSON' do 
      let(:sites) { FactoryBot.create_list(:sequenced_site_with_products, 5) }
      let(:sorted_sites) { sites.sort_by { |site| [-site.products.count, site.name] } }

      before do 
        sites
        get '/sites', headers: headers 
      end

      it 'returns a list of the top 5 sites as a JSON' do 
        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(response.body).to eq(sorted_sites.to_json)
      end

      it 'returns them in order of product count' do 
        top_site = sorted_sites.first
        last_site = sorted_sites.last

        expect(parsed_body.first['name']).to eq(top_site.name)
        expect(parsed_body.last['name']).to eq(last_site.name)
      end
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
        expect(parsed_body[:message]).to eq("Your submission was successful.")
      end

      it 'returns the redirect link in the response' do 
        expect(parsed_body[:redirect_link]).to eq(sites_path)
      end
    end
  end

  describe 'GET /sites/:id' do
    let(:site) { FactoryBot.create(:site_with_products) }

    it 'displays the show page for a site' do
      get "/sites/#{site.id}"

      expect(response).to be_successful
      expect(response.content_type).to eq("text/html; charset=utf-8")
    end

    context 'when the request wants JSON' do 
      let(:site_name) { site.name }
      let(:site_url) { site.url }
      let(:products) { site.products }

      before {  get "/sites/#{site.id}", headers: headers }

      it 'returns the site as a JSON' do
        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(parsed_body[:site][:name]).to eq(site_name)
        expect(parsed_body[:site][:url]).to eq(site_url)
      end

      it 'fetches the products for the given site' do
        expect(parsed_body[:products].length).to eq(products.length)
      end 
    end
  end
end
