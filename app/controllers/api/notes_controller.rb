class Api::NotesController < ApplicationController
  before_action :set_collection, only: [:index]
  before_action :set_record, only: [:show, :update]

  def index
    @pagy, @items = pagy(@collection, page: params[:page], items: params[:items])
    @meta = pagy_metadata(@pagy)
    # убрано на время
    # render json: {
    #     data: NoteBlueprint.render_as_json(@items),
    #     meta: @meta
    # }
    render json: {
        data: @collection
    }
  end

  def create
    new_note = @current_user.notes.new(required_params)
    new_note.save!

    render json: {
        data: NoteBlueprint.render_as_json(new_note)
    }
  end

  private

  def set_collection
    @collection = @current_user.notes
  end

  def set_record
    @record = Note.find_by(id: params[:id])
  end

  protected

  def required_params
    params.require(:note).permit(permitted_attributes)
  end

  def permitted_attributes
    [:text]
  end
end
