# frozen_string_literal: true

module Record
  class Create < ApplicationService
    def call
      valid_attributes = model::Create::Schema.call!(**attributes)

      instance = model.new(**valid_attributes)
      authorize(instance, :create?)
      instance.save!

      add_service_result(instance)
    end
  end
end
