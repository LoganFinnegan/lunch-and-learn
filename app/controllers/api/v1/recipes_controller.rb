class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country].present?
      country = params[:country]
    else 
      country = CountryFacade.get_country.name
    end

    recipes = EdamamFacade.search_recipes(country)
    if recipes.present?
     render json: RecipeSerializer.new(recipes)
    else
      render json: { data: [] }
    end
  end
end 