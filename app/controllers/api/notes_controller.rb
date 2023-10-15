class Api::NotesController < ApplicationController
  before_action :set_collection, only: [:index]

  def index
    @pagy, @items = pagy(@collection, page: params[:page], items: params[:items])
    @meta = pagy_metadata(@pagy)
    render json: {
        data: @items,
        meta: @meta
    }
  end

  private

  def set_collection
    @collection = @current_user.notes
  end
end
