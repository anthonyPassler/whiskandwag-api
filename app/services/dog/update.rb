# frozen_string_literal: true

class Dog
  class Update < ApplicationService
    def call
      valid_attributes = Dog::Update::Schema.call!(**attributes)

      dog = Dog.find(id)
      authorize(dog, :update?)
      dog.assign_attributes(**valid_attributes)
      dog.save!

      add_service_result(dog)
    end
  end
end
