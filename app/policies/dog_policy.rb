# frozen_string_literal: true

class DogPolicy < ApplicationPolicy
  def show?
    anonymous? || user_is_owner?
  end

  def update?
    show?
  end

  def create?
    true
  end

  def destroy?
    user.present? && user_is_owner?
  end

  def show_allergies_relationship?
    show?
  end

  class Scope < Scope
    def resolve
      return scope.none if user.nil?

      scope.where(user:)
    end
  end

  private

  def anonymous?
    record.user.nil?
  end

  def user_is_owner?
    return false if record.user.nil?

    record.user == user
  end
end
