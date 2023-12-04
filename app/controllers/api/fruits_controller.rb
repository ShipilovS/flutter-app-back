class Api::FruitsController < ApplicationController
  before_action :set_collection, only: [
      :index,
      :update,
      :fruits_by_date,
      :create_user_fruit
  ]
  before_action :set_record, only: [:show]

  def index
    @pagy, @items = pagy(Fruit.all, page: params[:page], items: params[:items])
    @meta = pagy_metadata(@pagy)
    # убрано на время
    # render json: {
    #     data: NoteBlueprint.render_as_json(@items),
    #     meta: @meta
    # }
    render json: {
        data: Fruit.all
    }
  end

  def show
    render json: { data: @record }
  end

  def fruits_by_date
    @collection = @collection.where(
        user_fruits: {
            selected_date: Date.parse(params[:selected_date]&.to_s || Date.today.to_s)
        }
    )

    @pagy, @items = pagy(@collection, page: params[:page], items: params[:items])
    @meta = pagy_metadata(@pagy)
    # убрано на время
    # render json: {
    #     data: @items,
    #     meta: @meta
    # }
    render json: {
        data: FruitBlueprint.render_as_hash(@collection)
    }
  end

  def create_user_fruit

  end

  private

  def set_collection
    @collection = Fruit.joins(:user_fruits).where(user_fruits: {user_id: @current_user.id})
  end

  def set_record
    @record = Fruit.find_by(id: params[:id])
    raise ActiveRecord::RecordNotFound if @record.nil?
  end

end
