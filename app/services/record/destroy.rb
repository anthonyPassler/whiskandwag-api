# frozen_string_literal: true

module Record
  class Destroy < ApplicationService
    def call
      instance = model.find(id)
      authorize(instance, :destroy?)

      instance.destroy!
    end
  end
end
