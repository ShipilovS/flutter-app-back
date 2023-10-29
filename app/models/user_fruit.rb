class UserFruit < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  belongs_to :fruit, foreign_key: :fruit_id
end
