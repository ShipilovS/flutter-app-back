class Api::FruitsController < ApplicationController
  before_action :set_collection, only: [
      :index,
      :update,
      :fruits_by_date,
      :create_user_fruit
  ]
  before_action :set_record, only: [:show]
  before_action :set_user_fruit, only: [:destroy_user_fruit]

  def index
    @pagy, @items = pagy(Fruit.all, page: params[:page], items: params[:items])
    @meta = pagy_metadata(@pagy)
    # убрано на время
    # render json: {
    #     data: FruitBlueprint.render_as_json(@items),
    #     meta: @meta
    # }
    #         data: FruitBlueprint.render_as_json(Fruit.all)
    render json: {
        data: FruitBlueprint.render_as_json(Fruit.all)
    }
  end

  def show
    render json: { data: @record }
  end

  def fruits_by_date
    @collection = @collection.where(
      selected_date: Date.parse(params[:selected_date]&.to_s || Date.today.to_s)
    )

    @pagy, @items = pagy(@collection, page: params[:page], items: params[:items])
    @meta = pagy_metadata(@pagy)
    # убрано на время
    # render json: {
    #     data: @items,
    #     meta: @meta
    # }
    render json: {
        data: UserFruitBlueprint.render_as_hash(@collection)
    }
  end

  def create_user_fruit
    user_fruit = @current_user.user_fruits.new(
        permitted_params
    )
    user_fruit.selected_date = Date.today.to_s
    user_fruit.save
    success(user_fruit)
  end

  def destroy_user_fruit
    @user_fruit.destroy
    success(@user_fruit)
  end

  private

  def set_collection
    @collection = UserFruit.where(user_fruits: {user_id: @current_user.id})
  end

  def set_record
    @record = Fruit.find_by(id: params[:id])
    raise ActiveRecord::RecordNotFound if @record.nil?
  end

  def set_user_fruit
    @user_fruit = find_by_or_404(UserFruit, params[:id])
  end

  def permitted_params
    params.require(:fruit).permit(:fruit_id)
  end

end
