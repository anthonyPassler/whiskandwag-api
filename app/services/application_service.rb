# frozen_string_literal: true

class ApplicationService
  def self.call(**kwargs, &block)
    new(**kwargs, &block).call
  end

  def initialize(**kwargs)
    kwargs.each do |key, value|
      instance_variable_set("@#{key}", value)
      self.class.send(:attr_reader, key.to_sym)
    end
  end
end
