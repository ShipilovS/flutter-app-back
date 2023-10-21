class Api::NotesController < ApplicationController
  before_action :set_collection, only: [:index]
  before_action :set_record, only: [:show, :update]

  def index
    @pagy, @items = pagy(@collection, page: params[:page], items: params[:items])
    @meta = pagy_metadata(@pagy)
    render json: {
        data: NoteBlueprint.render_as_json(@items),
        meta: @meta
    }
  end

  private

  def set_collection
    @collection = @current_user.notes
  end

  def set_record
    @record = Note.find_by(id: params[:id])
  end
end
