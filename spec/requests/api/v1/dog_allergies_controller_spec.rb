# frozen_string_literal: true

require "swagger_helper"

RSpec.describe "DogAllergies" do
  path "/api/v1/dogs/{id}/allergies" do
    get("list dog allergies") do
      let(:dog) { create(:dog) }
      let(:allergen1) { create(:allergen) }
      let(:allergen2) { create(:allergen) }
      let(:dog_allergy1) { create(:dog_allergy, dog: dog, allergen: allergen1) }
      let(:dog_allergy2) { create(:dog_allergy, dog: dog, allergen: allergen2) }

      response(200, "successful") do
        description "List of dog allergies"
        produces "application/json"
        parameter name: :id, in: :path, type: :string

        let(:id) { dog.id }

        include_context "with integration test"
      end
    end
  end
end
