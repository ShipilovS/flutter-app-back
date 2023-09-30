class ApplicationController < ActionController::API
  include Pundit::Authorization
  include AuthJwt
  before_action :authenticate, except: [:login]

  private

  def authenticate
    header = request.headers['Authorization']
    header = header.split(" ").last if header
    decoded_token = jwt_decode(header)
    @current_user = User.find(decoded_token['id'])
  end
end
