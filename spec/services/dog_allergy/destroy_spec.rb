# frozen_string_literal: true

require "rails_helper"

RSpec.describe DogAllergy::Destroy, type: :service do
  subject(:service) { described_class.call(dog_id:, allergen_id:, current_user:) }

  let!(:dog_allergy) { create(:dog_allergy) }
  let(:dog_id) { dog_allergy.dog_id }
  let(:allergen_id) { dog_allergy.allergen_id }
  let(:current_user) { dog_allergy.dog.user }

  shared_examples "destroys a dog allergy" do
    it do
      expect(DogAllergy.count).to eq(1)
      expect { service }.to change(DogAllergy, :count).by(-1)
      expect(DogAllergy.count).to eq(0)
    end
  end

  shared_examples "returns a RecordNotFound error" do
    it do
      expect { service }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  context "when the dog is owned by the current user" do
    context "when the dog allergy exists" do
      it_behaves_like "destroys a dog allergy"
    end

    context "when the dog allergy does not exist" do
      let(:dog_id) { "invalid dog" }
      let(:allergen_id) { "invalid allergen" }

      it_behaves_like "returns a RecordNotFound error"
    end
  end

  context "when the dog user is still anonymous" do
    let(:dog) { create(:dog, user: nil) }
    let!(:dog_allergy) { create(:dog_allergy, dog:) }

    context "when the dog allergy exists" do
      it_behaves_like "destroys a dog allergy"
    end

    context "when the dog allergy does not exist" do
      let(:dog_id) { "invalid dog" }
      let(:allergen_id) { "invalid allergen" }

      it_behaves_like "returns a RecordNotFound error"
    end
  end
end
