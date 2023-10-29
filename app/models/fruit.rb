class Fruit < ApplicationRecord
  validates_uniqueness_of :name
  has_many :user_fruits, foreign_key: :fruit_id, dependent: :destroy
  has_many :users, through: :user_fruits
end
