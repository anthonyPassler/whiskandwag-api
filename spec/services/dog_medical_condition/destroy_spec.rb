# frozen_string_literal: true

require "rails_helper"

RSpec.describe DogMedicalCondition::Destroy, type: :service do
  subject(:service) { described_class.call(dog_id:, medical_condition_id:, current_user:) }

  let!(:dog_medical_condition) { create(:dog_medical_condition) }
  let(:dog_id) { dog_medical_condition.dog_id }
  let(:medical_condition_id) { dog_medical_condition.medical_condition_id }
  let(:current_user) { dog_medical_condition.dog.user }

  shared_examples "destroys a dog medical condition" do
    it do
      expect(DogMedicalCondition.count).to eq(1)
      expect { service }.to change(DogMedicalCondition, :count).by(-1)
      expect(DogMedicalCondition.count).to eq(0)
    end
  end

  shared_examples "returns a RecordNotFound error" do
    it do
      expect { service }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  context "when the dog is owned by the current user" do
    context "when the dog medical condition exists" do
      it_behaves_like "destroys a dog medical condition"
    end

    context "when the dog medical condition does not exist" do
      let(:dog_id) { "invalid dog" }
      let(:medical_condition_id) { "invalid allergen" }

      it_behaves_like "returns a RecordNotFound error"
    end
  end

  context "when the dog user is still anonymous" do
    let(:dog) { create(:dog, user: nil) }
    let!(:dog_medical_condition) { create(:dog_medical_condition, dog:) }

    context "when the dog medical condition exists" do
      it_behaves_like "destroys a dog medical condition"
    end

    context "when the dog medical condition does not exist" do
      let(:dog_id) { "invalid dog" }
      let(:medical_condition_id) { "invalid allergen" }

      it_behaves_like "returns a RecordNotFound error"
    end
  end
end
