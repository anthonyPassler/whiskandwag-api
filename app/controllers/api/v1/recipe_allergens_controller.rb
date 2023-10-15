# frozen_string_literal: true

module API
  module  V1
    class RecipeAllergensController < ApplicationController
      skip_before_action :authenticate_user!, only: %i[index]

      def index
        recipe_allergens = Record::GetRelationship.call(
          model: Recipe,
          current_user:,
          id: params[:recipe_id],
          relationship: :allergens
        )

        render json: AllergenSerializer.new(recipe_allergens)
      end
    end
  end
end
