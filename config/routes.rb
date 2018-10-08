Rails.application.routes.draw do

  root to: 'trips#index'

  resources :drivers
  resources :trips
  
  resources :passengers do
    resources :trips, only: [:create]
  end

  post '/trips/:id', to: 'trips#rated'

end
