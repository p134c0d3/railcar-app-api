Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"


  # Order routes
  get "/cars" => "orders#index" # List all orders
  get "/cars/:id" => "orders#show" # List a single order
  post "/cars" => "orders#create" # Create a new order
  put "/cars/:id" => "orders#update" # Update an order
  delete "/cars/:id" => "orders#destroy" # Delete an order
  get "/cars/:id/raw_material" => "orders#order_raw_material" # List all raw materials for an order
  post "/cars/import" => "orders#import" # Import orders from a CSV file

  # RawMaterial routes
  get "/raw_materials" => "raw_material#index" # List all raw materials
  get "/raw_materials/:id" => "raw_material#show" # Show a specific raw material
  post "/raw_materials" => "raw_material#add" # Add a new raw material
  put "/raw_materials/:id" => "raw_material#update" # Update a raw material
  delete "/raw_materials/:id" => "raw_material#delete" # Delete a raw material
  get "/raw_materials/:id/orders" => "raw_material#raw_material_orders" # List all orders for a specific raw material
  
# Login route
post '/login', to: 'sessions#create'


# User routes
resources :users

end
