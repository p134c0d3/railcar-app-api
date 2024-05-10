class UserBlueprint < Blueprinter::Base
  identifier :id

  view :normal do
    fields :email, :first_name, :last_name, :user_type
  end
  
  view :me do
    association :profile, blueprint: ProfileBlueprint, view: :normal 
  end
end