Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :trips do
    resources :passengers, include: [:index, :show]
  end

  resources :passengers do
    resources :trips, include: [:index, :create, :new]
  end

  # get '/passengers', to: 'passengers#index', as: 'all_passengers'
  #
  # get '/passengers/new', to: 'passengers#new', as: 'new_passenger'
  # post "/passengers", to: "passengers#create"
  #
  #
  # get '/passengers/:id/edit', to: 'passengers#edit', as: 'edit_passenger'
  # patch '/passengers/:id', to: 'passengers#update'
  #
  # delete '/passengers/:id', to: 'passengers#destroy'
  #
  #
  # get '/passengers/:id', to: 'passengers#show', as: 'passenger'



  # Drivers routes
  resources :drivers do
    resources :trips, include: [:new, :index, :show]
  end

  # get '/drivers', to: 'drivers#index', as: 'all_drivers'
  #
  # get '/drivers/new', to: 'drivers#new', as: 'new_driver'
  # post '/drivers', to: 'drivers#create'
  #
  # get '/drivers/:id/edit', to: 'drivers#edit', as: 'edit_driver'
  # patch '/drivers/:id', to: 'drivers#update'
  #
  # delete '/drivers/:id', to: 'drivers#destroy'
  #
  # get '/drivers/:id', to: 'drivers#show', as: 'driver'



  # Trips routes


  #
  # get '/trips', to: 'trips#index', as: 'all_trips'
  #
  # get '/trips/new', to: 'trips#new', as: 'new_trip'
  # post '/trips', to: 'trips#create'
  #
  # get '/trips/:id/edit', to: 'trips#edit', as: 'edit_trip'
  # patch '/trips/:id', to: 'trips#update'
  #
  # get '/trips/:id', to: 'trips#show', as: 'trip'
end
