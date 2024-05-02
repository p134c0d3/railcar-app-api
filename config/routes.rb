Rails.application.routes.draw do


  
  
  

  
  
# Login route
post '/login', to: 'sessions#create'


# User routes
resources :users

end
