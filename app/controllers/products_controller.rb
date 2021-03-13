class ProductsController < ApplicationController
  def index 
    respond_to do |format|
      format.html
      format.json do 
        response.headers['Vary'] = 'Accept'
        render json: Product.all
      end
    end
  end
end