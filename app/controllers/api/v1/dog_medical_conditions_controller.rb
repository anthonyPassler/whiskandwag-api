# frozen_string_literal: true

module API
  module  V1
    class DogMedicalConditionsController < ApplicationController
      skip_before_action :authenticate_user!, only: %i[index create destroy]

      def index
        dog_medical_conditions = Record::GetRelationship.call(
          model: Dog,
          current_user:,
          id: params[:dog_id],
          relationship: :medical_conditions
        )

        render json: MedicalConditionSerializer.new(dog_medical_conditions)
      end

      def create
        dog_medical_condition = DogMedicalCondition::Create.call(
          dog_id: params[:dog_id],
          medical_condition_id: relationships.dig(:medical_condition, :data, :id),
          current_user:
        ).result

        render json: DogMedicalConditionSerializer.new(dog_medical_condition)
      end

      def destroy
        DogMedicalCondition::Destroy.call(
          dog_id: params[:dog_id],
          medical_condition_id: params[:id],
          current_user:
        )

        head :no_content
      end
    end
  end
end
