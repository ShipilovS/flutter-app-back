require 'jwt'

module AuthJwt
  extend ActiveSupport::Concern
  EXP = 1.day.freeze

  def jwt_encode(payload)
    payload[:exp] = Time.now.to_i + EXP.seconds
    JWT.encode(payload, Rails.application.secret_key_base)
  end

  def jwt_decode(token)
    decoded_user = JWT.decode(token, Rails.application.secret_key_base)[0]
    decoded_user
  end
end