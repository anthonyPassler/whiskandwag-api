# frozen_string_literal: true

module Api
  module V1
    class OrdersController < ApplicationController
      skip_before_action :authenticate_user!, only: %i[index show]

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
  end
end
