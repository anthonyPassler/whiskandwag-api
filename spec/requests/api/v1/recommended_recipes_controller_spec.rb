# frozen_string_literal: true

require "swagger_helper"

RSpec.describe "RecommendedRecipes" do
  path "/api/v1/dogs/{id}/recommended_recipes" do
    get("list recommended recipes") do
      let(:dog) { create(:dog) }
      let(:recipe1) { create(:recipe) }
      let(:recipe2) { create(:recipe) }
      let(:recommended_recipe1) { create(:recommended_recipe, dog:, recipe: recipe1) }
      let(:recommended_recipe2) { create(:recommended_recipe, dog:, recipe: recipe2) }

      response(200, "successful") do
        description "List of recommended recipes for a dog"
        produces "application/json"
        parameter name: :id, in: :path, type: :string

        let(:id) { dog.id }

        include_context "with integration test"
      end
    end
  end
end
