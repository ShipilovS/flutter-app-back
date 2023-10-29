class CreateUserFruits < ActiveRecord::Migration[7.0]
  def change
    create_table :user_fruits do |t|
      t.references :user, foreign_key: true,  null: false
      t.references :fruit,  foreign_key: true,  null: false
      t.date :selected_date
      t.timestamps
    end
  end
end
