class Api::V1::TouristSitesController < ApplicationController
  def index 
    lat_lon = GeoCountriesFacade.find_country(params[:country]).first
    places  = GeoapifyFacade.search_for(lat_lon)
    render json: TouristSiteSerializer.new(places)
  end
end