class UserBlueprint < Blueprinter::Base
  # identifier :id

  view :normal do
    fields :first_name
  end
end
  
