# frozen_string_literal: true

class Dog
  class Create < ApplicationService
    def call
      valid_attributes = Dog::Create::Schema.call!(**attributes)

      dog = Dog.new(**valid_attributes)
      authorize(dog, :create?)
      dog.save!

      add_service_result(dog)
    end
  end
end
