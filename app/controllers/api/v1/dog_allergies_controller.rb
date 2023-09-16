# frozen_string_literal: true

module API
  module  V1
    class DogAllergiesController < ApplicationController
      skip_before_action :authenticate_user!, only: %i[index create destroy]

      def index
        dog_allergies = Record::GetRelationship.call(
          model: Dog,
          current_user:,
          id: params[:dog_id],
          relationship: :allergies
        )

        render json: AllergenSerializer.new(dog_allergies)
      end

      def create
        dog_allergy = DogAllergy::Create.call(
          dog_id: params[:dog_id],
          allergen_id: relationships.dig(:allergen, :data, :id),
          current_user:
        ).result

        render json: DogAllergySerializer.new(dog_allergy)
      end

      def destroy
        DogAllergy::Destroy.call(
          dog_id: params[:dog_id],
          allergen_id: params[:id],
          current_user:
        )

        head :no_content
      end
    end
  end
end
