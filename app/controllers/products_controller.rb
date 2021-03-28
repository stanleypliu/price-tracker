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

  def new
  end

  def create 
    new_product = Product.find_or_initialize_by(product_params)

    if new_product.id.present?
      render json: { 
        redirect_link: new_product_path.to_s, 
        message: "That product\'s already present", 
        status: :unprocessable_entity 
      }
    else
      new_product.save
      render json: { 
        redirect_link: products_path.to_s, 
        message: 'Your submission was successful.', 
        status: :created 
      }
    end
  end

  def show 
    respond_to do |format|
      format.html
      format.json do
        response.headers['Vary'] = 'Accept'
        render json: Product.find(individual_product_params)
      end
    end
  end

  private 

  def product_params 
    params.require(:product).permit(:name)
  end

  def individual_product_params 
    params.permit(:id)['id'].to_i
  end
end