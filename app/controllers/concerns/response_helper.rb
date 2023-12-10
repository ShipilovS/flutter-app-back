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
    elsif action_name.include?('destroy')
      render json: {
          data: data
      }, status: 204
    else
      render json: {
          data: data
      }, status: 200
    end
  end


  def bad_request
    raise ActionController::BadRequest.new(), "Bad Request"
  end

  def find_by_or_404(record_class, id)
    obj = record_class.find_by(id: id)
    if obj.present?
      return obj
    else
      raise ActiveRecord::RecordNotFound
    end
  end


end