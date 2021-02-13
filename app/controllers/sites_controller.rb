class SitesController < ApplicationController
  def index 
    render json: Site.all
  end

  def new 
    render json: Site.new
  end

  private 

  def site_params
    params.require(:site).permit(:name, :url)
  end
end