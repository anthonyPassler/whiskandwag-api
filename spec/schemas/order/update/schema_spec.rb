# frozen_string_literal: true

require "rails_helper"
require "schema_shared_examples"

RSpec.describe Order::Update::Schema, type: :schema do
  subject { described_class.call!(data) }

  let(:required_attributes) { {} }

  describe "total_price" do
    context "with valid attributes" do
      it_behaves_like "valid data", "total_price", [1222, 1222.22, "1222.22"]
    end

    context "with invalid attributes" do
      it_behaves_like "invalid data", "total_price", [nil, "", "lots", true, 0, -1, 100_000_001]
    end
  end

  describe "fulfilled_at" do
    context "with valid attributes" do
      it_behaves_like "valid data", "fulfilled_at", ["2023-01-01"]
    end

    context "with invalid attributes" do
      it_behaves_like "invalid data", "fulfilled_at", [nil, "", "lots", true, 0, -1, 10.3, 100_000_001]
    end
  end

  describe "dispatch_date" do
    context "with valid attributes" do
      it_behaves_like "valid data", "dispatch_date", ["2023-01-01"]
    end

    context "with invalid attributes" do
      it_behaves_like "invalid data", "dispatch_date", [nil, "", "lots", true, 0, -1, 10.3, 100_000_001]
    end
  end

  describe "status" do
    context "with valid attributes" do
      it_behaves_like "valid data", "status", %w[active cancelled dispatched fulfilled]
    end

    context "with invalid attributes" do
      it_behaves_like "invalid data", "status", [nil, "", "lots", true, 0, -1, 10.3, 100_000_001]
    end
  end
end
