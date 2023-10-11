# frozen_string_literal: true

class MedicalConditionPolicy < ApplicationPolicy
  def show?
    user.present?
  end

  class Scope < Scope
    def resolve
      return scope.all if user.present?

      scope.none
    end
  end
end
