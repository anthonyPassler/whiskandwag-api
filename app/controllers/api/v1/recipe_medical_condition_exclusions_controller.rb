# frozen_string_literal: true

module API
  module V1
    class RecipeMedicalConditionExclusionsController < ApplicationController
      skip_before_action :authenticate_user!, only: %i[index]

      def index
        medical_conditions = Record::GetRelationship.call(
          model: Recipe,
          current_user:,
          id: params[:recipe_id],
          relationship: :medical_condition_exclusions
        )

        render json: MedicalConditionSerializer.new(medical_conditions)
      end
    end
  end
end
