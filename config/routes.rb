Rails.application.routes.draw do
  get 'home/index', as: 'home'
  root "home#index"

  resources :trips, except: [:new, :create]

  resources :drivers

  resources :passengers do
    resources :trips, only: [:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
