# frozen_string_literal: true

require "rails_helper"

RSpec.describe Record::Create, type: :service do
  subject(:service) { described_class.call(model:, current_user:, attributes:, relationships:) }

  let(:current_user) { create(:user) }
  let(:attributes) { { name: "Howard" } }
  let(:relationships) { nil }
  let(:model) { Dog }

  context "with valid attributes" do
    it "creates a dog" do
      expect { service }.to change(Dog, :count).by(1)
    end

    it "returns a dog with the correct attributes" do
      expect(service.result).to be_a(Dog)
      expect(service.result.name).to eq("Howard")
    end

    context "with valid relationships" do
      let(:relationships) do
        {
          user: {
            data: {
              id: current_user.id,
              type: "user"
            }
          }
        }
      end

      it "creates a dog with the correct relationships" do
        expect { service }.to change(Dog, :count).by(1)
        expect(service.result.user).to eq(current_user)
      end
    end
  end

  context "with invalid attributes" do
    let(:attributes) { { name: "" } }

    it "does not create a dog" do
      expect { service }.to raise_error(ApplicationSchema::ValidationSchemaError)
    end
  end
end
