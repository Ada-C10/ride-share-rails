Rails.application.routes.draw do

  root "trips#index"

  get '/trips', to: 'trips#index', as: 'trips'

  get '/trips/new', to: 'trips#new', as: 'new_trip'
  post '/trips', to: 'trips#create'

  get '/trips/:id', to: 'trips#show', as: 'trip'
  get '/trips/:id/edit', to: 'trips#edit', as: 'edit_trip'
  patch '/trips/:id', to: 'trips#update'

  delete '/passengers/:id', to: 'passengers#destroy'



  root "passengers#index"

  get '/passengers', to: 'passengers#index', as: 'passengers'

  get '/passengers/new', to: 'passengers#new', as: 'new_passenger'
  post '/passengers', to: 'passengers#create'

  get '/passengers/:id', to: 'passengers#show', as: 'passenger'
  get '/passengers/:id/edit', to: 'passengers#edit', as: 'edit_passenger'
  patch '/passengers/:id', to: 'passengers#update'

  delete '/passengers/:id', to: 'passengers#destroy'

end
