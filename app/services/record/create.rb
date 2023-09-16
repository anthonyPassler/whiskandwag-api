# frozen_string_literal: true

module Record
  class Create < ApplicationService
    def call
      valid_attributes = model::Create::Schema.call!(**attributes, relationships:)

      instance = model.new(**valid_attributes.except(:relationships))

      add_relationships!(instance) if relationships.present?

      authorize(instance, :create?)

      instance.save!

      add_service_result(instance)
    end

    private

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
