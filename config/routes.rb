Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homes#index'

  get '/homes', to: 'homes#index'

  resources :drivers
  resources :trips, except: [:new, :create]
  resources :passengers

  post 'drivers/:id/make_available', to: 'drivers#make_available', as: 'available'

  post 'drivers/:id/make_unavailable', to: 'drivers#make_unavailable', as: 'unavailable'

  # post '/passengers/:passenger_id/trips/new', to: 'trips#create', as: 'passenger_new_trip'

  resources :passengers do
    resources :trips, only: [:index, :create]
  end

  resources :drivers do
    resources :trips, only: [:index]
  end

end
