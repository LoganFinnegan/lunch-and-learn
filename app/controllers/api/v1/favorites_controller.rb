class Api::V1::FavoritesController < ApplicationController
  def index 
    user  = User.find_by(api_pwd: params[:api_key])
    if user
      faves = user.favorites
      render json: FavoriteSerializer.new(faves)
    else
      # require 'pry'; binding.pry 
      render json: { error: "Invalid API key" }, status: :unauthorized
    end
  end

  def create
    user = User.find_by(api_pwd: params[:api_key])
    if user 
      user.favorites.create!(fave_params)
      render json: { success: "Favorite added successfully" }, status: :created
    else
      render json: { error: "User does not have necessary permission" }, status: :unauthorized
    end
  end

  private

  def fave_params
    params.permit(:country, :recipe_link, :recipe_title)
  end
end