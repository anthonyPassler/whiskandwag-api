# frozen_string_literal: true

require "swagger_helper"

RSpec.describe "api/v1/dogs", type: :request do
  path "/api/v1/dogs" do
    get("list dogs") do
      response(200, "successful") do
        let(:user) { create(:user) }
        let(:dog) { create(:dog, user:) }
        let(:dog2) { create(:dog, user:) }

        include_context "with integration test"
      end
    end

    post("create dog") do
      description "Creates a dog"
      consumes "application/json"
      parameter name: :dog, in: :body, schema: {
        type: :object,
        properties: {
          data: {
            type: :object,
            properties: {
              attributes: {
                type: :object,
                properties: {
                  name: { type: :string },
                  breed: { type: :string }
                }
              }
            }
          }
        },
        required: %w[name]
      }
      produces "application/json"

      response(200, "successful") do
        let(:dog) { { data: { attributes: { name: "Fido", breed: "Labrador" } } } }

        include_context "with integration test"
      end

      response(422, "unprocessable entity") do
        let(:dog) { { data: { attributes: { name: nil, breed: nil } } } }

        include_context "with integration test"
      end
    end
  end

  path "/api/v1/dogs/{id}" do
    get("show dog") do
      description "Retrieves a dog"
      produces "application/json"
      parameter name: :id, in: :path, type: :string

      response(200, "successful") do
        let(:dog) { create(:dog) }
        let(:id) { dog.id }

        include_context "with integration test"
      end

      response(404, "not found") do
        let(:id) { "invalid" }

        include_context "with integration test"
      end
    end

    delete("destroy dog") do
      description "Destroys a dog"
      produces "application/json"
      parameter name: :id, in: :path, type: :string

      response(204, "no content") do
        let(:user) { create(:user) }
        let(:dog) { create(:dog, user:) }
        let(:id) { dog.id }

        run_test!
      end

      response(404, "not found") do
        let(:id) { "invalid" }

        run_test!
      end
    end
  end
end
