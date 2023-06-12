# frozen_string_literal: true

require "rails_helper"

RSpec.describe Dog::Update, type: :service do
  subject(:service) { described_class.call(current_user: current_user, id: dog.id, attributes: attributes) }
  let(:dog) { create(:dog, name: "Luke", user: user) }
  let(:user) { create(:user) }

  shared_examples "updates the dog" do
    it do
      expect(service.result.breed).to eq("Poodle")
      expect(service.result.weight).to eq(10)
      expect(service.result.age).to eq(5)
      expect(service.result.allergies).to eq(["gluten"])
      expect(service.result.kcal_per_day).to eq(1000)
    end
  end

  shared_examples "does not update the dog" do
    it do
      expect { service }.to raise_error(ApplicationSchema::ValidationSchemaError)
      expect(dog.reload.name).to eq("Luke")
    end
  end

  context "when the current user is the dog's owner" do
    let(:current_user) { user }

    context "with valid attributes" do
      let(:attributes) do
        {
          breed: "Poodle",
          weight: 10,
          age: 5,
          allergies: ["gluten"],
          kcal_per_day: 1000,
        }
      end

      it_behaves_like "updates the dog"
    end

    context "with invalid attributes" do
      let(:attributes) { { name: "" } }

      it_behaves_like "does not update the dog"
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
            age: 5,
            allergies: ["gluten"],
            kcal_per_day: 1000,
          }
        end

        it_behaves_like "updates the dog"
      end

      context "with invalid attributes" do
        let(:attributes) { { name: "" } }

        it_behaves_like "does not update the dog"
      end
    end

    context "when dog has an owner" do
      context "with valid attributes" do
        let(:attributes) do
          {
            breed: "Poodle",
            weight: 10,
            age: 5,
            allergies: ["gluten"],
            kcal_per_day: 1000,
          }
        end

        it "raises an error" do
          expect { service }.to raise_error(Pundit::NotAuthorizedError)
        end
      end
    end
  end
end
