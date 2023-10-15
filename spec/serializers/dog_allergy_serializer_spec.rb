# frozen_string_literal: true

require "rails_helper"

RSpec.describe DogAllergySerializer do
  subject(:dog_allergy_serializer) { described_class.new(dog_allergy, options) }

  let(:dog_allergy) { create(:dog_allergy) }
  let(:options) { {} }

  describe "json" do
    it "serializes correctly" do
      expect(dog_allergy_serializer).to match_snapshot("dog_allergy_serializer")
    end
  end
end
