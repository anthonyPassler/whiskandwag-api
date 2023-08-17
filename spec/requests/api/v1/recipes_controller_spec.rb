# frozen_string_literal: true

require "swagger_helper"

RSpec.describe "api/v1/recipes" do
  path "/api/v1/recipes" do
    get("list recipes") do
      response(200, "successful") do
        let(:recipe) { create(:recipe) }

        include_context "with integration test"
      end
    end
  end

  path "/api/v1/recipes/{id}" do
    get("show recipe") do
      description "Shows a recipe"
      produces "application/json"
      parameter name: :id, in: :path, type: :string

      response(200, "successful") do
        let!(:current_user) { create(:user) }
        let(:recipe) { create(:recipe) }

        let(:id) { recipe.id }

        include_context "with integration test"
      end

      response(404, "not found") do
        let(:id) { "invalid" }

        include_context "with integration test"
      end
    end
  end
end
