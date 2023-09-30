require 'jwt'

module AuthJwt
  extend ActiveSupport::Concern

  def jwt_encode(payload, exp = 1.day.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def jwt_decode(token)
    decoded_user = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
    decoded_user
  end
end