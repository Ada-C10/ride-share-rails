Rails.application.routes.draw do

  root 'trips#homepage'

  resources :trips
  patch '/trips/:id/rating', to: 'trips#update_rating', as: 'trip_update_rating'
  get '/trips/:id/rating', to: 'trips#edit_rating', as: 'trip_edit_rating'

  resources :drivers
  patch '/drivers/:id/status', to: 'drivers#status', as: 'driver_status'
  # delete '/drivers/:id', to: 'drivers#destroy'

  resources :passengers do
    resources :trips, only: [:create]

  end

  patch '/passengers/:id/status', to: 'passengers#status', as: 'passenger_status'



  # get '/drivers', to: 'drivers#index'
  # get '/drivers/new', to: 'drivers#new', as: 'new_driver'
  # post '/drivers', to: 'drivers#create'
  #
  # get '/drivers/:id', to: 'drivers#show', as: 'driver'
  # get '/drivers/:id/edit', to: 'drivers#edit', as: 'edit_driver'
  # patch '/drivers/:id', to: 'drivers#update'

  # get '/trips', to: 'trips#index', as: 'trips'
  #
  # get '/trips/new', to: 'trips#new', as: 'new_trip'
  # post '/trips', to: 'trips#create'
  #
  # get '/trips/:id', to: 'trips#show', as: 'trip'
  # get '/trips/:id/edit', to: 'trips#edit', as: 'edit_trip'
  # patch '/trips/:id', to: 'trips#update'
  #
  # delete '/trips/:id', to: 'trips#destroy'



  # get '/passengers', to: 'passengers#index', as: 'passengers'
  #
  # get '/passengers/new', to: 'passengers#new', as: 'new_passenger'
  # post '/passengers', to: 'passengers#create'
  #
  # get '/passengers/:id', to: 'passengers#show', as: 'passenger'
  #
  # get '/passengers/:id/edit', to: 'passengers#edit', as: 'edit_passenger'
  # patch '/passengers/:id', to: 'passengers#update'
  # patch '/passengers/:id/status', to: 'passengers#status', as: 'passenger_status'
  # delete '/passengers/:id', to: 'passengers#destroy'

end
