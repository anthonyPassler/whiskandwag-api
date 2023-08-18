# frozen_string_literal: true

class RecommendedRecipePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.none if user.blank?

      scope.where(dog: user.dogs)
    end
  end
end
