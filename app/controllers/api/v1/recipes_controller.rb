class Api::V1::RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    recipes = policy_scope(Recipe)

    render json: RecipeSerializer.new(recipes)
  end

  def show
    recipe = Recipe.find(params[:id])
    authorize recipe

    render json: RecipeSerializer.new(recipe)
  end
end
