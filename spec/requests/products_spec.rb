require 'rails_helper'

RSpec.describe "Products", type: :request do
  let(:headers) { { "Accept": "application/json" } }

  describe "GET /index" do
    it 'gets the index page' do
      get '/products'

      expect(response).to be_successful
      expect(response.content_type).to eq("text/html; charset=utf-8")
    end

    context 'when the request wants JSON' do 
      let(:products) { FactoryBot.create_list(:product, 4) } 

      it 'returns a list of all products as a JSON' do 
        products
        get '/products', headers: headers

        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(response.body).to eq(products.to_json)
      end
    end
  end

  describe "GET /products/:id" do 
    let(:product) { FactoryBot.create(:product) }

    it 'displays the show page for a product' do
      get "/products/#{product.id}"

      expect(response).to be_successful
      expect(response.content_type).to eq("text/html; charset=utf-8")
    end

    context 'when the request wants JSON' do 
      it 'returns the product as a JSON' do
        get "/products/#{product.id}", headers: headers

        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(response.body).to eq(product.to_json)
      end
    end
  end

end
