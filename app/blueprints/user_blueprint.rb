class UserBlueprint < Blueprinter::Base
  identifier :id

  view :normal do
    fields :email, :first_name, :last_name, :user_type
  end
end