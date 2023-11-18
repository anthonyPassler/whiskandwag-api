# frozen_string_literal: true

require "swagger_helper"

RSpec.describe "RecipeMedicalConditionExclusions" do
  path "/api/v1/recipes/{id}/medical_condition_exclusions" do
    get("list recipe medical condition exclusions") do
      let!(:current_user) { create(:user) }
      let(:recipe) { create(:recipe) }
      let(:medical_condition1) { create(:medical_condition) }
      let(:medical_condition2) { create(:medical_condition) }
      let(:recipe_medical_condition_exclusion1) do
        create(:recipe_medical_condition_exclusion, recipe:, medical_condition: medical_condition1)
      end
      let(:recipe_medical_condition_exclusion2) do
        create(:recipe_medical_condition_exclusion, recipe:, medical_condition: medical_condition1)
      end

      response(200, "successful") do
        description "List of recipe medical condition exclusions"
        produces "application/json"
        parameter name: :id, in: :path, type: :string

        let(:id) { recipe.id }

        include_context "with integration test"
      end
    end
  end
end
