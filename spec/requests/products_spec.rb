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

  describe 'GET /new' do 
    it 'gets the new product page' do 
      get '/products/new' 

      expect(response).to be_successful 
    end
  end

  describe 'POST /products' do 
    let(:product_params) { FactoryBot.attributes_for(:static_product) }
    let(:post_request) { post '/products', params: { product: product_params }, headers: headers }
    let(:success) { ProductsController::MESSAGES[:success] }
    let(:already_present) { ProductsController::MESSAGES[:already_present] }

    context 'when the product is already present' do 
      let(:present_product) { FactoryBot.create(:static_product) }

      before do
        present_product
        post_request
      end

      it 'contains the redirect path in the response' do 
        expect(parsed_body[:redirect_link]).to eq(new_product_path)
      end

      it 'returns the correct message' do 
        expect(parsed_body[:message]).to eq(already_present)
      end

      it 'contains the correct status' do 
        expect(parsed_body[:status]).to eq("unprocessable_entity")
      end
    end

    context 'when the product is absent' do 
      let(:product_double) {  
        instance_double(
          Product,
          name: 'Product',
          populate_initial_info: nil,
          save: false,
          id: nil
        ) 
      }

      before do
        allow(Product).to receive(:find_or_initialize_by).and_return(product_double)
        post_request 
      end

      it 'saves the product' do
        expect(product_double).to have_received(:save)
      end

      it 'contains the redirect path in the response' do 
        expect(parsed_body[:redirect_link]).to eq(products_path)
      end

      it 'returns the correct message' do 
        expect(parsed_body[:message]).to eq(success)
      end

      it 'contains the correct status' do 
        expect(parsed_body[:status]).to eq("created")
      end
    end
  end
end
