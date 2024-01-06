require 'jwt'

module AuthJwt
  extend ActiveSupport::Concern
  EXP = 1.days.freeze
  EXP_REFRESH = 60.days.freeze

  def jwt_encode(payload)
    payload[:exp] = Time.now.to_i + EXP.seconds
    access_token  = JWT.encode(payload, Rails.application.secret_key_base)
    payload[:exp] = Time.now.to_i + EXP_REFRESH.seconds
    refresh_token = JWT.encode(payload, ENV['REFRESH_SECRET'])
    return access_token, refresh_token
  end

  def jwt_decode(token, secret=Rails.application.secret_key_base)
    decoded_user = JWT.decode(token, secret)[0]
    decoded_user
  end
end