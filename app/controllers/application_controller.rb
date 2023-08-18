# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pundit::Authorization
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError,   with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ApplicationSchema::ValidationSchemaError, with: :unprocessable_entity
  rescue_from ApplicationService::ServiceError, with: :unprocessable_entity

  # TODO: Remove this method when authentication is implemented - will be added as a microservice
  def current_user
    User.first
  end

  private

  def options
    {}.merge(params[:include].present? ? { include: params[:include].split(",") } : {})
  end

  def attributes
    request.request_parameters.dig("data", "attributes")
  end

  def relationships
    request.request_parameters.dig("data", "relationships")
  end

  def user_not_authorized(exception)
    render json: {
      error: "Unauthorized #{exception.policy.class.to_s.underscore.camelize}.#{exception.query}"
    }, status: :unauthorized
  end

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def unprocessable_entity(exception)
    render json: { error: exception.message }, status: :unprocessable_entity
  end
end
