# frozen_string_literal: true

require "swagger_helper"

RSpec.describe "api/v1/orders" do
  path "/api/v1/orders" do
    get("list orders") do
      response(200, "successful") do
        let(:user) { create(:user) }
        let(:dog) { create(:dog, user:) }
        let(:order) { create(:order, user:, dog:) }

        include_context "with integration test"
      end
    end

    post("create order") do
      description "Creates a order"
      consumes "application/json"
      parameter name: :order, in: :body, schema: {
        type: :object,
        properties: {
          data: {
            type: :object,
            properties: {
              attributes: {
                type: :object,
                properties: {
                  total_price: { type: :number },
                  frequency_in_weeks: { type: :integer }
                }
              },
              relationships: {
                type: :object,
                properties: {
                  user: {
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
                  },
                  dog: {
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
        required: %w[total_price frequency_in_weeks user dog]
      }
      produces "application/json"

      response(200, "successful") do
        let(:user) { create(:user) }
        let(:dog) { create(:dog, user:) }
        let(:order) do
          {
            data: {
              attributes: {
                total_price: 1234.56,
                frequency_in_weeks: 4
              },
              relationships: {
                user: {
                  data: {
                    id: user.id,
                    type: "user"
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
        let(:order) { { data: { attributes: { total_price: nil, frequency_in_weeks: nil } } } }

        include_context "with integration test"
      end
    end
  end

  path "/api/v1/orders/{id}" do
    get("show order") do
      description "Retrieves a order"
      produces "application/json"
      parameter name: :id, in: :path, type: :string

      response(200, "successful") do
        let(:user) { create(:user) }
        let(:dog) { create(:dog, user:) }
        let(:order) { create(:order, user:, dog:) }

        let(:id) { order.id }

        include_context "with integration test"
      end

      response(404, "not found") do
        let(:id) { "invalid" }

        include_context "with integration test"
      end
    end

    patch("updates a order") do
      description "Updates a order"
      consumes "application/json"
      parameter name: :id, in: :path, type: :string
      parameter name: :order, in: :body, schema: {
        type: :object,
        properties: {
          data: {
            type: :object,
            properties: {
              attributes: {
                type: :object,
                properties: {
                  total_price: { type: :number },
                  frequency_in_weeks: { type: :integer }
                }
              }
            }
          }
        }
      }
      produces "application/json"

      response(200, "successful") do
        let(:user) { create(:user) }
        let(:dog) { create(:dog, user:) }
        let(:order_to_update) { create(:order, user:, dog:) }
        let(:id) { order_to_update.id }
        let(:order) do
          {
            data: {
              attributes: {
                total_price: 1234.56,
                frequency_in_weeks: 4
              },
              relationships: {
                user: {
                  data: {
                    id: user.id,
                    type: "user"
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
        let(:user) { create(:user) }
        let(:dog) { create(:dog, user:) }
        let(:order_to_update) { create(:order, user:, dog:) }
        let(:id) { order_to_update.id }
        let(:order) { { data: { attributes: { total_price: nil, frequency_in_weeks: nil } } } }

        include_context "with integration test"
      end
    end

    delete("destroy order") do
      description "Destroys a order"
      produces "application/json"
      parameter name: :id, in: :path, type: :string

      response(204, "no content") do
        let(:user) { create(:user) }
        let(:dog) { create(:dog, user:) }
        let(:order) { create(:order, user:, dog:) }
        let(:id) { order.id }

        run_test!
      end

      response(404, "not found") do
        let(:id) { "invalid" }

        run_test!
      end
    end
  end
end
