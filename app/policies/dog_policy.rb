# frozen_string_literal: true

class DogPolicy < ApplicationPolicy
  def show?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
