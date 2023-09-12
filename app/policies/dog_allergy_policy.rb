# frozen_string_literal: true

class DogAllergyPolicy < ApplicationPolicy
  def create?
    DogPolicy.new(user, record.dog).show?
  end

  def destroy?
    create?
  end
end
