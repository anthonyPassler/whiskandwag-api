# frozen_string_literal: true

module Record
  class Update < ApplicationService
    def call
      instance = model.find(id)
      authorize(instance, :update?)

      add_attributes!(instance) if attributes.present?

      add_relationships!(instance) if relationships.present?

      instance.save!

      add_service_result(instance)
    end

    private

    def add_attributes!(instance)
      valid_attributes = model::Update::Schema.call!(**attributes, relationships:)

      instance.assign_attributes(**valid_attributes.except(:relationships))
    end

    def add_relationships!(instance)
      relationships.each_key do |key|
        value = relationships[key][:data]
        id = value[:id]
        relationship = key.to_s.classify.constantize.find(id)

        instance.send("#{key}=", relationship)
      end
    end
  end
end
