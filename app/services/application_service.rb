# frozen_string_literal: true

class ApplicationService
  include Pundit::Authorization

  def self.call(**kwargs, &block)
    new(**kwargs, &block).call
  end

  def initialize(**kwargs)
    kwargs.each do |key, value|
      instance_variable_set("@#{key}", value)
      self.class.send(:attr_reader, key.to_sym)
    end
  end

  private

  def add_error!(error)
    raise ServiceError, error
  end

  def add_service_result(result)
    result = ServiceResult.new(result:)
    if result.errors.present?
      add_error!(result.errors.full_messages.join(", "))
    else
      result
    end
  end

  class ServiceError < StandardError; end

  class ServiceResult
    attr_reader :result, :errors

    def initialize(result:)
      @result = result
      @errors = result.errors
    end
  end
end
