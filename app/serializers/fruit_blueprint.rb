class FruitBlueprint < Blueprinter::Base
  identifier :id
  fields :name, :size_gram, :kilocalories

  association :user_fruits, blueprint: UserFruitBlueprint
end