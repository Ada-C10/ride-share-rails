Rails.application.routes.draw do
  root to: 'trips#index'
  resources :trips
  resources :drivers
  resources :passengers do
    resources :trips, only: [:create]
  end

  patch 'drivers/:id/change_status', to: 'drivers#change_status', as: 'change_status'
end
