# frozen_string_literal: true

module API
  module V1
    class DogsController < ApplicationController
      skip_before_action :authenticate_user!, only: %i[index show create]

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
    end
  end
end
