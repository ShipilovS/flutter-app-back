require 'pry'
class Api::AuthenticationsController < ApplicationController

  def login
    @user = User.find_by(email: params[:email])
    if @user.present? && @user.valid_password?(params[:password].to_s) # make password_digest
      payload = { id: @user.id }
      token = jwt_encode(payload)
      render json: {
          data: {
              token: token
          }
      }
    else
      render json: {
          data: {},
          errors: 'NotAuthorizedError'
      }
    end
  end

end
