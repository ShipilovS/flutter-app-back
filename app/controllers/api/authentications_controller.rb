require 'pry'
class Api::AuthenticationsController < ApplicationController

  def login
    @user = User.find_by(email: params[:email])
    if @user.present? && @user.valid_password?(params[:password].to_s) # make password_digest
      payload = { id: @user.id }
      access_token, refresh_token = jwt_encode(payload)
      render json: {
          data: {
              user_id: @user.id,
              token: access_token,
              refresh_token: refresh_token
          }
      }
    else
      raise Pundit::NotAuthorizedError
    end
  end

  def refresh
    decoded_jwt = jwt_decode(params[:refresh_token], secret=ENV['REFRESH_SECRET'])
    raise JWT::DecodeError unless decoded_jwt
    payload = { id: decoded_jwt['id'] }
    access_token, refresh_token = jwt_encode(payload)
    render json: {
        data: {
            user_id: decoded_jwt['id'],
            token: access_token,
            refresh_token: refresh_token
        }
    }
  end
end
