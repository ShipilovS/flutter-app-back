module ErrorsHelper
  extend ActiveSupport::Concern
  include ActiveSupport::Rescuable

  included do
    rescue_from JWT::DecodeError do |error|
      failure(error, 'Произошла ошибка', status: :internal_server_error)
    end

    rescue_from ActiveRecord::RecordNotFound do |error|
      failure(error, 'Запись не найдена', status: :not_found)
    end

    rescue_from Unauthorized, Pundit::NotAuthorizedError do |error|
      failure(error, 'Ошибка доступа', status: :unauthorized)
    end

    rescue_from JWT::JWKError, JWT::DecodeError do |error|
      failure(error, "Ошибка токена", status: :unauthorized)
    end

    rescue_from JWT::ExpiredSignature do |error|
      failure(error, "Время действия токена истекло", status: :unauthorized)
    end

  end

  private

  def failure(error, title, **kwargs)
    render json: {
        data: {},
        errors: {
            title: title,
            message: error.class,
            status: kwargs[:status],
        }
    }, status: kwargs[:status]
  end
end