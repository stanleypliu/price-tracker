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
    # TODO
  end

  private 

  def site_params
    params.require(:site).permit(:name, :url)
  end
end