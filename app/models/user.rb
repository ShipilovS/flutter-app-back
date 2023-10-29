class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  has_many :notes, class_name: "Note"
  has_many :user_fruits, foreign_key: :user_id, dependent: :destroy
  has_many :fruits, through: :user_fruits
  # has_and_belongs_to_many :fruits, join_table: "user_fruits"
end
