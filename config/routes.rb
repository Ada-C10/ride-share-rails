Rails.application.routes.draw do
  root 'trips#home'

  resources :passengers do
    resources :trips, only: [:index, :create]
    get 'passengers/:passenger_id/trips/in_progress', to: 'trips#in_progress', as: 'passenger_trip_inprogress'
  end

  resources :drivers do
    resources :trips, only: [:index]
  end

  get 'trips/home', to: 'trips#home', as: 'trips_home'
  resources :trips

end
