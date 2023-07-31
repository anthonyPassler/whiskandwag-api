# frozen_string_literal: true

class ApplicationSchema < Dry::Validation::Contract
  UUID_REGEXP = /^[0-9a-fA-F]{8}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{12}$/
  class ValidationSchemaError < StandardError; end

  def self.call!(attributes)
    new.call(attributes).then do |result|
      raise ValidationSchemaError, result.errors.to_h if result.errors.present?

      result.to_h
    end
  end
end
