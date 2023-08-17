# frozen_string_literal: true

require "rails_helper"

RSpec.describe RecipeSerializer do
  subject(:recipe_serializer) { described_class.new(recipe, options) }

  let(:recipe) { create(:recipe) }
  let(:options) { {} }

  describe "json" do
    it "serializes correctly" do
      expect(recipe_serializer).to match_snapshot("recipe_serializer")
    end
  end
end
