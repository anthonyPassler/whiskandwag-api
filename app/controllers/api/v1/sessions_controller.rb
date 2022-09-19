class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  skip_after_action :verify_authorized, except: :index
  skip_after_action :verify_policy_scoped, only: :index

  def create
    @user = User.find_by(email: params[:email])

    if @user&.valid_password?(params[:password])
      render json: @user.to_json(only: %i[id email]), status: :created
    else
      head(:unauthorized)
    end
  end

  def destroy

  end
end
