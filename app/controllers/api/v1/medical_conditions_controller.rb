# frozen_string_literal: true

module API
  module V1
    class MedicalConditionsController < ApplicationController
      skip_before_action :authenticate_user!, only: %i[index show]

      def index
        medical_conditions = policy_scope(MedicalCondition)

        render json: MedicalConditionSerializer.new(medical_conditions)
      end

      def show
        medical_condition = Record::Get.call(
          model: MedicalCondition,
          current_user:,
          id: params[:id]
        ).result

        render json: MedicalConditionSerializer.new(medical_condition)
      end
    end
  end
end
