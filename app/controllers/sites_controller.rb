class SitesController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json do
        # Needed to stop Chrome caching JSON
        response.headers['Vary'] = 'Accept'
        render json: Site.all
      end
    end
  end

  def new
  end

  def show
    respond_to do |format|
      format.html
      format.json do
        response.headers['Vary'] = 'Accept'
        render json: Site.find(individual_site_param)
      end
    end
  end

  def fetch_products
    # TODO - may need to include an `includes` here
    render json: { productCount: Site.find(individual_site_param).products.count }
  end

  def create
    new_site = Site.find_or_initialize_by(site_params)

    if new_site.id.present?
      render json: { 
        redirect_link: new_site_path.to_s, 
        message: "That site\'s already present", 
        status: :unprocessable_entity 
      }
    else
      new_site.save
      render json: { 
        redirect_link: sites_path.to_s, 
        message: 'Site successfully added', 
        status: :created 
      }
    end
  end

  private

  def site_params
    params.require(:site).permit(:name, :url)
  end

  def individual_site_param
    params.permit(:id)['id'].to_i
  end
end
