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

  def show 
    respond_to do |format|
      format.html
      format.json do
        response.headers['Vary'] = 'Accept'
        render json: Product.find(product_params)
      end
    end
  end

  private 

  def product_params 
    params.permit(:id)['id'].to_i
  end
end