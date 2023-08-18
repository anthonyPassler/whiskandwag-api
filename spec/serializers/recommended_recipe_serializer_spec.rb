# frozen_string_literal: true

require "rails_helper"

RSpec.describe RecommendedRecipeSerializer do
  subject(:recommended_recipe_serializer) { described_class.new(recommended_recipe, options) }

  let(:recommended_recipe) { create(:recommended_recipe) }
  let(:options) { {} }

  describe "json" do
    it "serializes correctly" do
      expect(recommended_recipe_serializer).to match_snapshot("recommended_recipe_serializer")
    end

    context "with includes" do
      let(:options) { { include: %i[recipe dog] } }

      it "serializes correctly" do
        expect(recommended_recipe_serializer).to match_snapshot("recommended_recipe_serializer_with_includes")
      end
    end
  end
end
