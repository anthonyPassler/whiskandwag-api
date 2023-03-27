class Api::V1::ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    reviews = policy_scope(Review)

    render json: ReviewSerializer.new(reviews)
  end

  def show
    review = Review.find(params[:id])

    authorize Review

    render json: ReviewSerializer.new(review)
  end
end
