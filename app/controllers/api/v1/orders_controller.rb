# frozen_string_literal: true

module API
  module V1
    class OrdersController < ApplicationController
      skip_before_action :authenticate_user!, only: %i[index show create update destroy]

      def index
        orders = policy_scope(Order)

        render json: OrderSerializer.new(orders)
      end

      def show
        order = Record::Get.call(
          model: Order,
          current_user:,
          id: params[:id]
        ).result

        render json: OrderSerializer.new(order)
      end

      def create
        order = Record::Create.call(
          model: Order,
          current_user:,
          attributes:,
          relationships:
        ).result

        render json: OrderSerializer.new(order)
      end

      def update
        order = Record::Update.call(
          model: Order,
          current_user:,
          id: params[:id],
          attributes:,
          relationships:
        ).result

        render json: OrderSerializer.new(order)
      end

      def destroy
        Record::Destroy.call(
          model: Order,
          current_user:,
          id: params[:id]
        )

        head :no_content
      end
    end
  end
end
