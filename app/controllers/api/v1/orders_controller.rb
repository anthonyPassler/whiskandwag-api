class Api::V1::OrdersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    orders = policy_scope(Order)

    render json: OrderSerializer.new(orders)
  end

  def show
    order = Order.find(params[:id])
    authorize order

    render json: OrderSerializer.new(order)
  end
end
