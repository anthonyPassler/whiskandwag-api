# frozen_string_literal: true

module Record
  class Get < ApplicationService
    def call
      instance = model.find(id)

      authorize(instance, :show?)

      add_service_result(instance)
    end
  end
end
