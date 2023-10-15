# frozen_string_literal: true

require "rails_helper"

RSpec.describe DogMedicalCondition::Create, type: :service do
  subject(:service) { described_class.call(dog_id:, medical_condition_id:, current_user:) }

  let(:dog) { create(:dog, :with_user) }
  let(:medical_condition) { create(:medical_condition) }
  let(:current_user) { dog.user }

  context "with valid relationships" do
    let(:dog_id) { dog.id }
    let(:medical_condition_id) { medical_condition.id }

    it "creates a dog medical condition" do
      expect { service }.to change(DogMedicalCondition, :count).by(1)
      expect(service.result.dog).to eq(dog)
    end

    context "when the dog medical condition already exists" do
      let!(:dog_medical_condition) { create(:dog_medical_condition, dog:, medical_condition:) }

      it "does not create a dog medical condition" do
        expect { service }.to raise_error(ApplicationService::ServiceError)
      end
    end
  end

  context "with invalid relationships" do
    let(:dog_id) { "invalid dog" }
    let(:medical_condition_id) { "invalid medical condition" }

    it "does not create a dog medical condition" do
      expect { service }.to raise_error(ApplicationService::ServiceError)
    end
  end
end
