# frozen_string_literal: true

require "rails_helper"
require "schema_shared_examples"

RSpec.describe Order::Create::Schema, type: :schema do
  subject { described_class.call!(data) }

  let(:user) { create(:user) }
  let(:dog) { create(:dog, user:) }

  let(:required_attributes) do
    {
      total_price: 1000.20,
      frequency_in_weeks: 4,
      relationships: {
        user: {
          data: {
            id: user.id,
            type: "users"
          }
        },
        dog: {
          data: {
            id: dog.id,
            type: "dogs"
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

  describe "frequency_in_weeks" do
    context "with valid attributes" do
      it_behaves_like "valid data", "frequency_in_weeks", [4]
    end

    context "with invalid attributes" do
      it_behaves_like "invalid data", "frequency_in_weeks", [nil, "", "lots", true, 0, -1, 10.3, 100_000_001]
    end
  end

  describe "relationships" do
    context "with valid relationships" do
      it_behaves_like "valid data", "relationships",
                      [
                        {
                          user: {
                            data: {
                              id: "e1777686-2fd5-11ee-be56-0242ac120002",
                              type: "users"
                            }
                          },
                          dog: {
                            data: {
                              id: "e1777686-2fd5-11ee-be56-0242ac120003",
                              type: "dogs"
                            }
                          }
                        }
                      ]
    end

    context "with invalid relationships" do
      it_behaves_like "invalid data", "relationships", [nil, true, "cool age", "100", 1_000_000, { user: {} }]
    end
  end
end
