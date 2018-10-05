Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'

  resources :drivers do
      resources :trips, only: [:show]
    end

  resources :passengers do
    resources :trips, only: [:create, :edit, :update, :show]
  end

  patch 'drivers/:id/change_status', to: 'drivers#change_status', as: 'change_status'
end
