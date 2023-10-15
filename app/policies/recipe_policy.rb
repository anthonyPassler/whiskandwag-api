# frozen_string_literal: true

class RecipePolicy < ApplicationPolicy
  def show?
    user.present?
  end

  def show_allergens_relationship?
    show?
  end

  class Scope < Scope
    def resolve
      return scope.all if user.present?

      scope.none
    end
  end
end
