class Favorite < ApplicationRecord
  belongs_to :object, polymorphic: true
  belongs_to :user, foreign_key: :user_id
end
