class Fruit < ApplicationRecord
  validates_uniqueness_of :name
  has_many :user_fruits, foreign_key: :fruit_id, dependent: :destroy
  has_many :users, through: :user_fruits
  has_many :fruit_favorites, class_name: 'Favorite', foreign_key: :object_id, dependent: :destroy

  def is_favorite?
    self.fruit_favorites.present? ? true : false
  end
end
