Rails.application.routes.draw do

  root 'trips#index'

  get '/passengers', to: 'passengers#index', as: 'passengers'

  get '/passengers/new', to: 'passengers#new', as: 'new_passenger'
  post '/passengers', to: 'passengers#create'

  get '/passengers/:id/edit', to: 'passengers#edit', as: 'edit_passenger'

  get '/passengers/:id', to: 'passengers#show', as: 'passenger'

  patch '/passengers/:id', to: 'passengers#update'
  put '/passengers/:id', to: 'passengers#update'

  delete '/passengers/:id', to: 'passengers#destroy'

  get '/trips', to: 'trips#index', as: 'trips'

  get '/trips/new', to: 'trips#new', as: 'new_trip'
  post '/passengers/:passenger_id/trips/create', to: 'trips#create', as: 'request_trip'

  get '/trips/:id/edit', to: 'trips#edit', as: 'edit_trip'

  get '/trips/:id', to: 'trips#show', as: 'trip'

  patch '/trips/:id', to: 'trips#update'
  put '/trips/:id', to: 'trips#update'

  delete '/trips/:id', to: 'trips#destroy'

  get '/drivers', to: 'drivers#index', as: 'drivers'

  get '/drivers/new', to: 'drivers#new', as: 'new_driver'
  post '/drivers', to: 'drivers#create'

  get '/drivers/:id/edit', to: 'drivers#edit', as: 'edit_driver'

  get '/drivers/:id', to: 'drivers#show', as: 'driver'

  patch '/drivers/:id', to: 'drivers#update'
  put '/drivers/:id', to: 'drivers#update'

  delete '/drivers/:id', to: 'drivers#destroy'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
