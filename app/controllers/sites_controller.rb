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
        render json: Site.find(individual_site_param['id'].to_i)
      end
    end
  end

  def create 
    new_site = Site.find_or_initialize_by(site_params)

    if !new_site.id.present?
      new_site.save
      render json: { redirect_link: "#{sites_path}", message: 'Site successfully added' }
    else 
      render json: { redirect_link: "#{new_site_path}", message: "That site\'s already present" }
    end
  end

  private 

  def site_params
    params.require(:site).permit(:name, :url)
  end

  def individual_site_param
    params.permit(:id)
  end
end