# frozen_string_literal: true

require "rails_helper"

RSpec.describe RecommendedRecipePolicy, type: :policy do
  subject { described_class.new(current_user, recommended_recipe) }

  let(:dog) { create(:dog, :with_user) }
  let(:recommended_recipe) { create(:recommended_recipe, dog:) }
  let(:resolved_scope) { described_class::Scope.new(current_user, RecommendedRecipe.all).resolve }

  context "without a logged in user" do
    let(:current_user) { nil }

    it "does not include recommended_recipe in resolved scope" do
      expect(resolved_scope).not_to include(recommended_recipe)
    end
  end

  context "with a logged in user" do
    context "when user is not the owner of the dog" do
      let(:current_user) { create(:user) }

      it "does not include recommended_recipe in resolved scope" do
        expect(resolved_scope).not_to include(recommended_recipe)
      end
    end

    context "when user is the owner of the dog" do
      let(:current_user) { recommended_recipe.dog.user }

      it "does include recommended_recipe in resolved scope" do
        expect(resolved_scope).to include(recommended_recipe)
      end
    end
  end
end
