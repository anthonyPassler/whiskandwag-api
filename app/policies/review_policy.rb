# frozen_string_literal: true

class ReviewPolicy < ApplicationPolicy
  def show?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
