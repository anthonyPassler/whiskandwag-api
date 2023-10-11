# frozen_string_literal: true

require "rails_helper"

RSpec.describe MedicalConditionSerializer do
  subject(:medical_condition_serializer) { described_class.new(medical_condition, options) }

  let(:medical_condition) { create(:medical_condition) }
  let(:options) { {} }

  describe "json" do
    it "serializes correctly" do
      expect(medical_condition_serializer).to match_snapshot("medical_condition_serializer")
    end
  end
end
