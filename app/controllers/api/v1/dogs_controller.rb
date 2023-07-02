# frozen_string_literal: true

module API
  module V1
    class DogsController < ApplicationController
      skip_before_action :authenticate_user!, only: %i[index show create update destroy]

      def index
        dogs = policy_scope(Dog)

        render json: DogSerializer.new(dogs)
      end

      def show
        dog = Record::Get.call(
          model: Dog,
          current_user:,
          id: params[:id]
        ).result

        render json: DogSerializer.new(dog)
      end

      def create
        dog = Record::Create.call(
          model: Dog,
          current_user:,
          attributes:,
          relationships:
        ).result

        render json: DogSerializer.new(dog)
      end

      def update
        dog = Record::Update.call(
          model: Dog,
          current_user:,
          id: params[:id],
          attributes:,
          relationships:
        ).result

        render json: DogSerializer.new(dog)
      end

      def destroy
        Record::Destroy.call(
          model: Dog,
          current_user:,
          id: params[:id]
        )

        head :no_content
      end

      # TODO: Remove this method when authentication is implemented - will ber added as a microservice
      def current_user
        User.first
      end
    end
  end
end
