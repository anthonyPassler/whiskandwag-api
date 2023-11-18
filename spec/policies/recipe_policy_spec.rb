# frozen_string_literal: true

require "rails_helper"

RSpec.describe RecipePolicy, type: :policy do
  subject(:recipe_policy) { described_class.new(current_user, recipe) }

  let(:recipe) { create(:recipe) }
  let(:resolved_scope) { described_class::Scope.new(current_user, Recipe.all).resolve }

  context "without a logged in user" do
    let(:current_user) { nil }

    it do
      expect(recipe_policy).to(
        forbid_actions(%i[show show_allergens_relationship show_medical_condition_exclusions_relationship])
      )
    end

    it "does not include recipe in resolved scope" do
      expect(resolved_scope).not_to include(recipe)
    end
  end

  context "with a logged in user" do
    let(:current_user) { create(:user) }

    it do
      expect(recipe_policy).to(
        permit_actions(%i[show show_allergens_relationship show_medical_condition_exclusions_relationship])
      )
    end

    it "does include recipe in resolved scope" do
      expect(resolved_scope).to include(recipe)
    end
  end
end
