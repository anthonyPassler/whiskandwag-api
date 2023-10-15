# frozen_string_literal: true

require "swagger_helper"

RSpec.describe "DogMedicalConditions" do
  path "/api/v1/dogs/{id}/medical_conditions" do
    get("list dog medical conditions") do
      let(:dog) { create(:dog) }
      let(:medical_condition1) { create(:medical_condition) }
      let(:medical_condition2) { create(:medical_condition) }
      let(:dog_medical_condition1) { create(:dog_medical_condition, dog:, medical_condition: medical_condition1) }
      let(:dog_medical_condition2) { create(:dog_medical_condition, dog:, medical_condition: medical_condition2) }

      response(200, "successful") do
        description "List of dog medical_conditions"
        produces "application/json"
        parameter name: :id, in: :path, type: :string

        let(:id) { dog.id }

        include_context "with integration test"
      end
    end

    post("create dog medical_condition") do
      description "Creates a dog medical condition"
      consumes "application/json"
      parameter name: :id, in: :path, type: :string
      parameter name: :dog_medical_condition, in: :body, schema: {
        type: :object,
        properties: {
          data: {
            type: :object,
            properties: {
              relationships: {
                type: :object,
                properties: {
                  medical_condition: {
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
        required: %w[medical_condition]
      }
      produces "application/json"

      response(200, "successful") do
        let(:medical_condition) { create(:medical_condition) }
        let(:dog) { create(:dog) }
        let(:id) { dog.id }
        let(:dog_medical_condition) do
          {
            data: {
              attributes: {},
              relationships: {
                medical_condition: {
                  data: {
                    id: medical_condition.id,
                    type: "medical_condition"
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
        let(:dog_medical_condition) do
          {
            data: {
              attributes: {},
              relationships: {
                medical_condition: {
                  data: {
                    id: "bar",
                    type: "medical_condition"
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

  path "/api/v1/dogs/{dog_id}/medical_conditions/{medical_condition_id}" do
    delete("destroy dog medical condition") do
      description "Destroys a dog medical condition"
      produces "application/json"
      parameter name: :dog_id, in: :path, type: :string
      parameter name: :medical_condition_id, in: :path, type: :string

      response(204, "no content") do
        let(:dog_medical_condition) { create(:dog_medical_condition) }
        let(:dog_id) { dog_medical_condition.dog_id }
        let(:medical_condition_id) { dog_medical_condition.medical_condition_id }

        run_test!
      end

      response(404, "not found") do
        let(:dog_id) { "invalid" }
        let(:medical_condition_id) { "invalid" }

        run_test!
      end
    end
  end
end
