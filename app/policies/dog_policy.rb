# frozen_string_literal: true

class DogPolicy < ApplicationPolicy
  def show?
    anonymous? || user_is_owner?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  private

  def anonymous?
    record.user.nil?
  end

  def user_is_owner?
    record.user == user
  end
end
