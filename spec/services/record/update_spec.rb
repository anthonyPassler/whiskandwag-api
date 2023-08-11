# frozen_string_literal: true

require "rails_helper"

RSpec.describe Record::Update, type: :service do
  subject(:service) { described_class.call(model:, current_user:, id: dog.id, attributes:, relationships:) }

  let(:model) { Dog }
  let(:dog) { create(:dog, name: "Luke", user:) }
  let(:user) { create(:user) }
  let(:attributes) { nil }
  let(:relationships) { nil }

  shared_examples "updates the dog's attributes" do
    it do
      expect(service.result.breed).to eq("Poodle")
      expect(service.result.weight).to eq(10)
      expect(service.result.age_in_months).to eq(60)
      expect(service.result.recommended_daily_calories).to eq(1000)
    end
  end

  shared_examples "does not update the dog's attributes" do
    it do
      expect { service }.to raise_error(ApplicationSchema::ValidationSchemaError)
      expect(dog.reload.name).to eq("Luke")
    end
  end

  describe "attributes" do
    context "when the current user is the dog's owner" do
      let(:current_user) { user }

      context "with valid attributes" do
        let(:attributes) do
          {
            breed: "Poodle",
            weight: 10,
            age_in_months: 60,
            recommended_daily_calories: 1000
          }
        end

        it_behaves_like "updates the dog's attributes"
      end

      context "with invalid attributes" do
        let(:attributes) { { name: "" } }

        it_behaves_like "does not update the dog's attributes"
      end
    end

    context "when the current user is not the dog's owner" do
      let(:current_user) { create(:user) }
      let(:attributes) { { name: "Howard" } }

      it "raises an error" do
        expect { service }.to raise_error(Pundit::NotAuthorizedError)
      end
    end

    context "when the current user is anonymous" do
      let(:current_user) { nil }

      context "when dog does not have an owner" do
        let(:dog) { create(:dog, name: "Luke") }

        context "with valid attributes" do
          let(:attributes) do
            {
              breed: "Poodle",
              weight: 10,
              age_in_months: 60,
              recommended_daily_calories: 1000
            }
          end

          it_behaves_like "updates the dog's attributes"
        end

        context "with invalid attributes" do
          let(:attributes) { { name: "" } }

          it_behaves_like "does not update the dog's attributes"
        end
      end

      context "when dog has an owner" do
        context "with valid attributes" do
          let(:attributes) do
            {
              breed: "Poodle",
              weight: 10,
              age_in_months: 60,
              recommended_daily_calories: 1000
            }
          end

          it "raises an error" do
            expect { service }.to raise_error(Pundit::NotAuthorizedError)
          end
        end
      end
    end
  end

  describe "relationships" do
    context "when a user relationship is present" do
      let(:dog) { create(:dog, name: "Luke") }
      let(:current_user) { create(:user) }
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

      it "updates the dog's relationships" do
        expect(service.result.user).to eq(current_user)
      end
    end
  end
end
