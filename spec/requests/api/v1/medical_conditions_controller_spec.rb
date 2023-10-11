# frozen_string_literal: true

require "swagger_helper"

RSpec.describe "api/v1/medical_conditions" do
  path "/api/v1/medical_conditions" do
    get("list medical conditions") do
      response(200, "successful") do
        let(:medical_condition) { create(:medical_condition) }

        include_context "with integration test"
      end
    end
  end

  path "/api/v1/medical_conditions/{id}" do
    get("show medical_condition") do
      description "Shows a medical condition"
      produces "application/json"
      parameter name: :id, in: :path, type: :string

      response(200, "successful") do
        let!(:current_user) { create(:user) }
        let(:medical_condition) { create(:medical_condition) }

        let(:id) { medical_condition.id }

        include_context "with integration test"
      end

      response(404, "not found") do
        let(:id) { "invalid" }

        include_context "with integration test"
      end
    end
  end
end
