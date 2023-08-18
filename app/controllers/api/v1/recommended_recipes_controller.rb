# frozen_string_literal: true

module API
  module V1
    class RecommendedRecipesController < ApplicationController
      skip_before_action :authenticate_user!, only: %i[index]

      def index
        recommended_recipes = policy_scope(RecommendedRecipe.where(dog_id: params[:dog_id]))

        render json: RecommendedRecipeSerializer.new(recommended_recipes, options)
      end
    end
  end
end
