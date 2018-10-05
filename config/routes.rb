Rails.application.routes.draw do
  root 'drivers#index'

  resources :drivers

  resources :trips

  resources :passengers do
    resources :trips, only: [:create]
  end
end
