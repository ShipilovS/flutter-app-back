class NoteBlueprint < Blueprinter::Base
  identifier :id
  fields :text, :created_at
end