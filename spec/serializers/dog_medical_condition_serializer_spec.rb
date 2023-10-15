# frozen_string_literal: true

require "rails_helper"

RSpec.describe DogMedicalConditionSerializer do
  subject(:dog_medical_condition_serializer) { described_class.new(dog_medical_condition, options) }

  let(:dog_medical_condition) { create(:dog_medical_condition) }
  let(:options) { {} }

  describe "json" do
    it "serializes correctly" do
      expect(dog_medical_condition_serializer).to match_snapshot("dog_medical_condition_serializer")
    end
  end
end
