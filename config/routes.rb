Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/passengers', to: 'passengers#index', as: 'all_passengers'

  get '/passengers/new', to: 'passengers#new', as: 'new_passenger'
  post "/passengers", to: "passengers#create"


  get '/passengers/:id/edit', to: 'passengers#edit', as: 'edit_passenger'
<<<<<<< HEAD
  patch '/passengers/:id', to: 'passengers#update'
=======
  patch '/passengers/:id', to: 'drivers#update'
>>>>>>> 439ac4ec19a24217cfad72a3835ff7e525f0fbc7



  get '/passengers/:id', to: 'passengers#show', as: 'passenger'

  # Drivers routes
  get '/drivers', to: 'drivers#index', as: 'all_drivers'

  get '/drivers/new', to: 'drivers#new', as: 'new_driver'
  post '/drivers', to: 'drivers#create'
  
  get '/drivers/:id/edit', to: 'drivers#edit', as: 'edit_driver'
  patch '/drivers/:id', to: 'drivers#update'

  get '/drivers/:id', to: 'drivers#show', as: 'driver'
end
