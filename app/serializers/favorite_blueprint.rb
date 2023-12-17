class FavoriteBlueprint < Blueprinter::Base
  identifier :id
  association :object, blueprint: FruitBlueprint
end