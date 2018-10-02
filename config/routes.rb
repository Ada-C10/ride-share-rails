Rails.application.routes.draw do

  root "drivers#index", as: 'drivers_root'

  get '/drivers', to: 'drivers#index'
  get '/drivers/new', to: 'drivers#new', as: 'new_driver'
  post '/drivers', to: 'drivers#create'

  get '/drivers/:id', to: 'drivers#show', as: 'driver'
  get '/drivers/:id/edit', to: 'drivers#edit', as: 'edit_driver'
  patch '/drivers/:id', to: 'drivers#update'

  delete '/drivers:id', to: 'drivers#destroy'



  root "trips#index", as: 'trips_root'

  get '/trips', to: 'trips#index', as: 'trips'

  get '/trips/new', to: 'trips#new', as: 'new_trip'
  post '/trips', to: 'trips#create'

  get '/trips/:id', to: 'trips#show', as: 'trip'
  get '/trips/:id/edit', to: 'trips#edit', as: 'edit_trip'
  patch '/trips/:id', to: 'trips#update'

  delete '/trips:id', to: 'trips#destroy'




  root "passengers#index", as: 'passengers_root'

  get '/passengers', to: 'passengers#index', as: 'passengers'

  get '/passengers/new', to: 'passengers#new', as: 'new_passenger'
  post '/passengers', to: 'passengers#create'

  get '/passengers/:id', to: 'passengers#show', as: 'passenger'
  get '/passengers/:id/edit', to: 'passengers#edit', as: 'edit_passenger'
  patch '/passengers/:id', to: 'passengers#update'

  delete '/passengers/:id', to: 'passengers#destroy'

end
