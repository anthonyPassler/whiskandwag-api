# frozen_string_literal: true

require "rails_helper"

RSpec.describe AllergenSerializer do
  subject(:allergen_serializer) { described_class.new(allergen, options) }

  let(:allergen) { create(:allergen) }
  let(:options) { {} }

  describe "json" do
    it "serializes correctly" do
      expect(allergen_serializer).to match_snapshot("allergen_serializer")
    end
  end
end
