class Api::NotesController < ApplicationController
  before_action :set_collection, only: [:index]

  def index
    render json: {
        data: @collection
    }
  end

  private

  def set_collection
    @collection = @current_user.notes
  end
end
