class SitesController < ApplicationController
  def index
    @sites = Site.all
  end

  def create
    site = Site.create(site_params)
    redirect_to sites_path
  end

  private

  def site_params
    params.require(:site).permit(:title, :url)
  end
end
