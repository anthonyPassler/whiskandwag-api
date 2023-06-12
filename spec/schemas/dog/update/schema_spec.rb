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

  describe "age" do
    context "with valid attributes" do
      it_behaves_like "valid data", "age", [1, 100, 999]
    end

    context "with invalid attributes" do
      it_behaves_like "invalid data", "age", [nil, true, "cool age", "100", 1000]
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

  describe "health_issues" do
    context "with valid attributes" do
      it_behaves_like "valid data", "health_issues", [%w[cancer diabetes], ["anything"]]
    end

    context "with invalid attributes" do
      it_behaves_like "invalid data", "health_issues", [nil, true, 1000]
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

  describe "allergies" do
    context "with valid attributes" do
      it_behaves_like "valid data", "allergies", [%w[gluten lactose], ["anything"]]
    end

    context "with invalid attributes" do
      it_behaves_like "invalid data", "allergies", [nil, true, 1000, "just a string"]
    end
  end

  describe "kcal_per_day" do
    context "with valid attributes" do
      it_behaves_like "valid data", "kcal_per_day", [1, 100, 999]
    end

    context "with invalid attributes" do
      it_behaves_like "invalid data", "kcal_per_day", [nil, true, "cool age", "100", 1_000_000]
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
end
