class AddDescriptionToFruits < ActiveRecord::Migration[7.0]
  def change
    add_column :fruits, :description, :text, default: ""
  end
end
