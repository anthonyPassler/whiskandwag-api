# frozen_string_literal: true

require "swagger_helper"

RSpec.describe "api/v1/allergens" do
  path "/api/v1/allergens" do
    get("list allergens") do
      response(200, "successful") do
        let(:allergen) { create(:allergen) }

        include_context "with integration test"
      end
    end

    path "/api/v1/allergens/{id}" do
      get("show allergen") do
        description "Shows an allergen"
        produces "application/json"
        parameter name: :id, in: :path, type: :string

        response(200, "successful") do
          let(:allergen) { create(:allergen) }

          let(:id) { allergen.id }

          include_context "with integration test"
        end

        response(404, "not found") do
          let(:id) { "invalid" }

          include_context "with integration test"
        end
      end
    end
  end
end
