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
        dog = Dog.find(params[:id])
        authorize dog

        render json: DogSerializer.new(dog)
      end

      def create
        dog = Dog::Create.call(
          current_user:,
          attributes:
        ).result

        render json: DogSerializer.new(dog)
      end

      def update
        dog = Dog::Update.call(
          current_user:,
          id: params[:id],
          attributes:
        ).result

        render json: DogSerializer.new(dog)
      end

      def destroy
        dog = Dog.find(params[:id])
        authorize dog

        dog.destroy!

        head :no_content
      end
      # TODO: Remove this method when authentication is implemented
      def current_user
        User.first
      end
    end
  end
end
