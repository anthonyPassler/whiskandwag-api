# frozen_string_literal: true

class OrderPolicy < ApplicationPolicy
  def show?
    true if user_is_owner?
  end

  def create?
    user.present?
  end

  def update?
    true if user_is_owner?
  end

  def destroy?
    true if user_is_owner?
  end

  class Scope < Scope
    def resolve
      return scope.none if user.nil?

      scope.where(user:)
    end
  end

  private

  def user_is_owner?
    return false if record.user.nil?

    record.user == user
  end
end
