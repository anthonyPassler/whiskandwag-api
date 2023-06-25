# frozen_string_literal: true

module Record
  class Update < ApplicationService
    def call
      valid_attributes = model::Update::Schema.call!(**attributes)

      instance = model.find(id)
      authorize(instance, :update?)
      instance.assign_attributes(**valid_attributes)
      instance.save!

      add_service_result(instance)
    end
  end
end
