# frozen_string_literal: true

module API
  module  V1
    class DogAllergiesController < ApplicationController
      skip_before_action :authenticate_user!, only: %i[index]

      def index
        dog_allergies = Record::GetRelationship.call(
          model: Dog,
          current_user:,
          id: params[:dog_id],
          relationship: :allergies
        )

        render json: AllergenSerializer.new(dog_allergies)
      end
    end
  end
end
