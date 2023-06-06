# frozen_string_literal: true

require "rails_helper"

shared_context "with integration test" do
  after do |example|
    example.metadata[:response][:content] = {
      "application/json" => {
        example: JSON.parse(response.body, symbolize_names: true)
      }
    }
  end

  run_test!
end
