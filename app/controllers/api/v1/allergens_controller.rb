# frozen_string_literal: true

module API
  module V1
    class AllergensController < ApplicationController
      skip_before_action :authenticate_user!, only: %i[index show]

      def index
        allergens = policy_scope(Allergen)

        render json: AllergenSerializer.new(allergens)
      end

      def show
        allergen = Record::Get.call(
          model: Allergen,
          current_user:,
          id: params[:id]
        ).result

        render json: AllergenSerializer.new(allergen)
      end
    end
  end
end
