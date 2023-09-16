# frozen_string_literal: true

module API
  module V1
    class RecommendedRecipesController < ApplicationController
      skip_before_action :authenticate_user!, only: %i[index]

      def index
        recommended_recipes = Record::GetRelationship.call(
          model: Dog,
          current_user:,
          id: params[:dog_id],
          relationship: :recipes
        )

        render json: RecipeSerializer.new(recommended_recipes)
      end
    end
  end
end
