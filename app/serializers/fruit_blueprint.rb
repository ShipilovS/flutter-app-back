class FruitBlueprint < Blueprinter::Base
  identifier :id
  fields :name, :size_gram, :kilocalories, :description

  association :user_fruits, blueprint: UserFruitBlueprint

  field (:is_favorite) do |obj|
    obj.is_favorite?
  end
end