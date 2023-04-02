# frozen_string_literal: true

class ApplicationSchema < Dry::Validation::Contract
  class ValidationSchemaError < StandardError; end

  def self.call!(attributes)
    new.call(attributes).then do |result|
      raise ValidationSchemaError, result.errors.to_h if result.errors.present?

      result.to_h
    end
  end
end
