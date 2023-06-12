# frozen_string_literal: true

class Dog
  class BaseSchema < ApplicationSchema
    DOG_GENDERS = %w[male female].freeze
    ACTIVITY_LEVELS = %w[low medium high very_high].freeze
    FUSSINESS_LEVELS = %w[low medium high very_high].freeze
  end
end
