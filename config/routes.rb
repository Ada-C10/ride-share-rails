Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'
  resources :trips, except: [:new, :create]
  resources :drivers
  resources :passengers do
    resources :trips, only: [:create]
  end

  patch 'drivers/:id/change_status', to: 'drivers#change_status', as: 'change_status'
end
