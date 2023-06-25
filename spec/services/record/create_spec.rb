# frozen_string_literal: true

require "rails_helper"

RSpec.describe Record::Create, type: :service do
  subject(:service) { described_class.call(model:, current_user:, attributes:) }

  let(:current_user) { create(:user) }
  let(:attributes) { { name: "Howard" } }
  let(:model) { Dog }

  context "with valid attributes" do
    it "creates a dog" do
      expect { service }.to change(Dog, :count).by(1)
    end

    it "returns a dog with the correct attributes" do
      expect(service.result).to be_a(Dog)
      expect(service.result.name).to eq("Howard")
    end
  end

  context "with invalid attributes" do
    let(:attributes) { { name: "" } }

    it "does not create a dog" do
      expect { service }.to raise_error(ApplicationSchema::ValidationSchemaError)
    end
  end
end
