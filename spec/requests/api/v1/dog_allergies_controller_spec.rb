# frozen_string_literal: true

require "swagger_helper"

RSpec.describe "DogAllergies" do
  path "/api/v1/dogs/{id}/allergies" do
    get("list dog allergies") do
      let(:dog) { create(:dog) }
      let(:allergen1) { create(:allergen) }
      let(:allergen2) { create(:allergen) }
      let(:dog_allergy1) { create(:dog_allergy, dog:, allergen: allergen1) }
      let(:dog_allergy2) { create(:dog_allergy, dog:, allergen: allergen2) }

      response(200, "successful") do
        description "List of dog allergies"
        produces "application/json"
        parameter name: :id, in: :path, type: :string

        let(:id) { dog.id }

        include_context "with integration test"
      end
    end

    post("create dog allergy") do
      description "Creates a dog allergy"
      consumes "application/json"
      parameter name: :id, in: :path, type: :string
      parameter name: :dog_allergy, in: :body, schema: {
        type: :object,
        properties: {
          data: {
            type: :object,
            properties: {
              relationships: {
                type: :object,
                properties: {
                  allergen: {
                    type: :object,
                    properties: {
                      data: {
                        type: :object,
                        properties: {
                          id: { type: :string },
                          type: { type: :string }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        },
        required: %w[allergen]
      }
      produces "application/json"

      response(200, "successful") do
        let(:allergen) { create(:allergen) }
        let(:dog) { create(:dog) }
        let(:id) { dog.id }
        let(:dog_allergy) do
          {
            data: {
              attributes: {},
              relationships: {
                allergen: {
                  data: {
                    id: allergen.id,
                    type: "allergen"
                  }
                },
                dog: {
                  data: {
                    id: dog.id,
                    type: "dog"
                  }
                }
              }
            }
          }
        end

        include_context "with integration test"
      end

      response(422, "unprocessable entity") do
        let(:id) { "foo" }
        let(:dog_allergy) do
          {
            data: {
              attributes: {},
              relationships: {
                allergen: {
                  data: {
                    id: "bar",
                    type: "allergen"
                  }
                },
                dog: {
                  data: {
                    id: "baz",
                    type: "dog"
                  }
                }
              }
            }
          }
        end

        include_context "with integration test"
      end
    end
  end

  path "/api/v1/dogs/{dog_id}/allergies/{allergen_id}" do
    delete("destroy dog allergy") do
      description "Destroys a dog allergy"
      produces "application/json"
      parameter name: :dog_id, in: :path, type: :string
      parameter name: :allergen_id, in: :path, type: :string

      response(204, "no content") do
        let(:dog_allergy) { create(:dog_allergy) }
        let(:dog_id) { dog_allergy.dog_id }
        let(:allergen_id) { dog_allergy.allergen_id }

        run_test!
      end

      response(404, "not found") do
        let(:dog_id) { "invalid" }
        let(:allergen_id) { "invalid" }

        run_test!
      end
    end
  end
end
