Rails.application.routes.draw do
  root to: 'trips#index'
  resources :trips
  resources :drivers
  resources :passengers do
    resources :trips, only: [:create]
  end
end
