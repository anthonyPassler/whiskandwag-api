class Api::V1::DogsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    dogs = policy_scope(Dog)

    render json: DogSerializer.new(dogs)
  end

  def show
    dog = Dog.find(params[:id])
    authorize dog

    render json: DogSerializer.new(dog)
  end
end
