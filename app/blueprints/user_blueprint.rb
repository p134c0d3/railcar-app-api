class UserBlueprint < Blueprinter::Base
  # identifier :id

  view :normal do
    fields :first_name, :last_name, :email, :user_type
  end
end
  
