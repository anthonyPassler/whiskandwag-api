# frozen_string_literal: true

module API
  module V1
    class RecipesController < ApplicationController
      skip_before_action :authenticate_user!, only: %i[index show]

      def index
        recipes = policy_scope(Recipe)

        render json: RecipeSerializer.new(recipes)
      end

      def show
        recipe = Record::Get.call(
          model: Recipe,
          current_user:,
          id: params[:id]
        ).result

        render json: RecipeSerializer.new(recipe)
      end
    end
  end
end
