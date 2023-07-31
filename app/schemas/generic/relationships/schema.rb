# frozen_string_literal: true

module Generic
  module Relationships
    class Schema < Dry::Schema::Params
      define do
        required(:data).hash do
          required(:id).filled(:string, format?: ApplicationSchema::UUID_REGEXP)
        end
      end
    end
  end
end
