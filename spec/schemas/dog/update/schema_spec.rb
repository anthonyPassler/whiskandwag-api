# frozen_string_literal: true

require "rails_helper"
require "schema_shared_examples"

RSpec.describe Dog::Update::Schema, type: :schema do
  subject { described_class.call!(data) }

  let(:required_attributes) { {} }

  describe "name" do
    context "with valid attributes" do
      it_behaves_like "valid data", "name", ["Howard", "toto", "this is a long name"]
    end

    context "with invalid attributes" do
      it_behaves_like "invalid data", "name", [nil, "", 1, true]
    end
  end

  describe "breed" do
    context "with valid attributes" do
      it_behaves_like "valid data", "breed", ["Husky", "this is a long breed name", nil, ""]
    end

    context "with invalid attributes" do
      it_behaves_like "invalid data", "breed", [1, true]
    end
  end

  describe "weight" do
    context "with valid attributes" do
      it_behaves_like "valid data", "weight", [1, 100, 999]
    end

    context "with invalid attributes" do
      it_behaves_like "invalid data", "weight", [nil, true, "cool weight", "100", 1000]
    end
  end

  describe "age_in_months" do
    context "with valid attributes" do
      it_behaves_like "valid data", "age_in_months", [1, 100, 999]
    end

    context "with invalid attributes" do
      it_behaves_like "invalid data", "age_in_months", [nil, true, "cool age", "100", 1000]
    end
  end

  describe "gender" do
    context "with valid attributes" do
      it_behaves_like "valid data", "gender", %w[male female]
    end

    context "with invalid attributes" do
      it_behaves_like "invalid data", "gender", [nil, true, "cool age", "100", 1000]
    end
  end

  describe "fussiness_level" do
    context "with valid attributes" do
      it_behaves_like "valid data", "fussiness_level", %w[low medium high very_high]
    end

    context "with invalid attributes" do
      it_behaves_like "invalid data", "fussiness_level", [nil, true, "cool age", "100", 1000]
    end
  end

  describe "activity_level" do
    context "with valid attributes" do
      it_behaves_like "valid data", "activity_level", %w[low medium high very_high]
    end

    context "with invalid attributes" do
      it_behaves_like "invalid data", "activity_level", [nil, true, 1000, "lazy"]
    end
  end

  describe "recommended_daily_calories" do
    context "with valid attributes" do
      it_behaves_like "valid data", "recommended_daily_calories", [1, 100, 999]
    end

    context "with invalid attributes" do
      it_behaves_like "invalid data", "recommended_daily_calories", [nil, true, "cool age", "100", 1_000_000]
    end
  end

  describe "food_portion_in_grams" do
    context "with valid attributes" do
      it_behaves_like "valid data", "food_portion_in_grams", [1, 100, 999]
    end

    context "with invalid attributes" do
      it_behaves_like "invalid data", "food_portion_in_grams", [nil, true, "cool age", "100", 1_000_000]
    end
  end

  describe "relationships" do
    context "with valid relationships" do
      it_behaves_like "valid data", "relationships",
                      [{ user: { data: { id: "e1777686-2fd5-11ee-be56-0242ac120002", type: "users" } } }]
    end

    context "with invalid relationships" do
      it_behaves_like "invalid data", "relationships", [true, "cool age", "100", 1_000_000, { user: {} }]
    end
  end
end
