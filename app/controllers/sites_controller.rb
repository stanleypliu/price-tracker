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
  end

  def create 
    new_site = Site.find_or_initialize_by(site_params)

    if !new_site.id.present?
      new_site.save
      render json: { redirect_link: "#{sites_path}" }
    else 
      render json: { redirect_link: "#{new_site_path}" }
    end
  end

  private 

  def site_params
    params.require(:site).permit(:name, :url)
  end
end