class Api::FavoritesController < ApplicationController
  before_action :set_collection, only: [:index]
  before_action :set_fruits_collection, only: [:index]
  before_action :set_record, only: [:show, :update, :destroy]

  def index
    render json: {
        data: FruitBlueprint.render_as_json(@fruits_collection)
    }
  end

  def create
    fruit = Fruit.find_by(id: params[:fruit_id])
    new_favorite = @current_user.favorites.find_or_create_by(
        object: fruit
    )
    new_favorite.save
    success(new_favorite)
  end

  def destroy
    @record.destroy
    success(@record)
  end

  private

  def set_collection
    @collection = @current_user.favorites
  end

  def set_fruits_collection
    @fruits_collection = @collection.map(&:object)
  end

  def set_record
    # by fruit id
    @record = Favorite.find_by(object_id: params[:id])
  end

  protected

  # def required_params
  #   params.require(:note).permit(permitted_attributes)
  # end
  #
  # def permitted_attributes
  #   [:text]
  # end
end
