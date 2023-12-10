class UserFruitBlueprint < Blueprinter::Base
  identifier :id
  fields :user_id, :fruit_id, :selected_date

  field (:fruit_name) do |obj|
    obj&.fruit&.name
  end
end