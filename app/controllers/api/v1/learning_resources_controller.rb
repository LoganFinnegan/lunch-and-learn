class Api::V1::LearningResourcesController < ApplicationController
  def index
    video    = YoutubeFacade.search_youtube(params[:country])
    resource = UnsplashFacade.search_image(params[:country], video)
    render json: LearningResourceSerializer.new(resource)
  end
end
