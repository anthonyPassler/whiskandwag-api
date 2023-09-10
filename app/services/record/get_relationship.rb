# frozen_string_literal: true

module Record
  class GetRelationship < ApplicationService
    def call
      instance = model.find(id)

      authorize(instance, "show_#{relationship}_relationship?")

      instance.public_send(relationship)
    end
  end
end
