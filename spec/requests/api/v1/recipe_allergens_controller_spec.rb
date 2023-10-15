# frozen_string_literal: true

require "swagger_helper"

RSpec.describe "RecipeAllergens" do
  path "/api/v1/recipes/{id}/allergens" do
    get("list recipe allergens") do
      let!(:current_user) { create(:user) }
      let(:recipe) { create(:recipe) }
      let(:allergen1) { create(:allergen) }
      let(:allergen2) { create(:allergen) }
      let(:recipe_allergy1) { create(:recipe_allergy, recipe:, allergen: allergen1) }
      let(:recipe_allergy2) { create(:recipe_allergy, recipe:, allergen: allergen2) }

      response(200, "successful") do
        description "List of recipe allergens"
        produces "application/json"
        parameter name: :id, in: :path, type: :string

        let(:id) { recipe.id }

        include_context "with integration test"
      end
    end
  end
end
