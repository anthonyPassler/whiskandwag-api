# frozen_string_literal: true

require "rails_helper"
require "schema_shared_examples"

RSpec.describe Order::Create::Schema, type: :schema do
  subject { described_class.call!(data) }

  let(:user) { create(:user) }

  let(:required_attributes) do
    {
      total_price: 1000.20,
      portions: 5,
      portion_weight_in_grams: 500,
      frequency_in_weeks: 4,
      relationships: {
        user: {
          data: {
            id: user.id,
            type: "users"
          }
        }
      }
    }
  end

  describe "total_price" do
    context "with valid attributes" do
      it_behaves_like "valid data", "total_price", [1222, 1222.22, "1222.22"]
    end

    context "with invalid attributes" do
      it_behaves_like "invalid data", "total_price", [nil, "", "lots", true, 0, -1, 100_000_001]
    end
  end

  describe "portions" do
    context "with valid attributes" do
      it_behaves_like "valid data", "portions", [5]
    end

    context "with invalid attributes" do
      it_behaves_like "invalid data", "portions", [nil, "", "lots", true, 0, -1, 10.3, 100_000_001]
    end
  end

  describe "portion_weight_in_grams" do
    context "with valid attributes" do
      it_behaves_like "valid data", "portion_weight_in_grams", [500]
    end

    context "with invalid attributes" do
      it_behaves_like "invalid data", "portion_weight_in_grams", [nil, "", "lots", true, 0, -1, 10.3, 100_000_001]
    end
  end

  describe "frequency_in_weeks" do
    context "with valid attributes" do
      it_behaves_like "valid data", "frequency_in_weeks", [4]
    end

    context "with invalid attributes" do
      it_behaves_like "invalid data", "frequency_in_weeks", [nil, "", "lots", true, 0, -1, 10.3, 100_000_001]
    end
  end
end