# frozen_string_literal: true

class DogMedicalConditionPolicy < ApplicationPolicy
  def create?
    DogPolicy.new(user, record.dog).show?
  end

  def destroy?
    create?
  end
end
