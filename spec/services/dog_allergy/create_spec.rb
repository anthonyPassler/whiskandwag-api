# frozen_string_literal: true

require "rails_helper"

RSpec.describe DogAllergy::Create, type: :service do
  subject(:service) { described_class.call(dog_id: dog_id, allergen_id: allergen_id) }

  let(:dog) { create(:dog) }
  let(:allergen) { create(:allergen) }

  context "with valid relationships" do
    let(:dog_id) { dog.id }
    let(:allergen_id) { allergen.id }

    it "creates a dog allergy" do
      expect { service }.to change(DogAllergy, :count).by(1)
      expect(service.result.dog).to eq(dog)
    end

    context "when the dog allergy already exists" do
      let!(:dog_allergy) { create(:dog_allergy, dog: dog, allergen: allergen) }

      it "does not create a dog allergy" do
        expect { service }.to raise_error(ApplicationService::ServiceError)
      end
    end
  end

  context "with invalid relationships" do
    let(:dog_id) { "invalid dog" }
    let(:allergen_id) { "invalid allergen" }

    it "does not create a dog allergy" do
      expect { service }.to raise_error(ApplicationService::ServiceError)
    end
  end
end
