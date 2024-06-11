class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country].present?
      country = params[:country]
      recipes = EdamamFacade.search_recipes(country)
      if recipes.present?
       render json: RecipeSerializer.new(recipes)
      else
        render json: { data: [] }
      end
    else 
      render json: { data: [] }
    end
  end
end 