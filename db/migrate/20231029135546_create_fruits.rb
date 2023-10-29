class CreateFruits < ActiveRecord::Migration[7.0]
  def change
    create_table :fruits do |t|
      t.string   :name,         comment: "Название"
      t.string   :size_gram,    comment: "Величина (в граммах)"
      t.string   :kilocalories, comment: "ккал"
      t.timestamps
    end
  end
end
