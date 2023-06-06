# frozen_string_literal: true

require "rails_helper"

RSpec.describe DogSerializer do
  subject(:dog_serializer) { described_class.new(dog, options) }

  let(:user) { create(:user) }
  let(:dog) { create(:dog, user:) }
  let(:options) { {} }

  describe "json" do
    it "serializes correctly" do
      expect(dog_serializer).to match_snapshot("dog_serializer")
    end

    context "with includes" do
      let(:options) { { include: %i[user] } }

      it "serializes correctly" do
        expect(dog_serializer).to match_snapshot("dog_serializer_with_includes")
      end
    end
  end
end
