class SitesController < ApplicationController
  def index 
    respond_to do |format|
      format.html
      format.json { render json: Site.all }
    end
  end

  def new 
    respond_to do |format|
      format.html
      format.json { render json: Site.new }
    end
  end

  private 

  def site_params
    params.require(:site).permit(:name, :url)
  end
end