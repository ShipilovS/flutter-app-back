module ResponseHelper
  extend ActiveSupport::Concern
  include ErrorsHelper

  def success(data)
    if data.errors.present?
      failure(
          data.errors,
          'Произошла ошибка',
      )
    elsif action_name.include?('create')
      render json: {
          data: data
      }, status: 201
    else
      render json: {
          data: data
      }, status: 200
    end
  end
end