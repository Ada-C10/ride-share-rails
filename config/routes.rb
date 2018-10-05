Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'

  resources :passengers
  resources :drivers
  resources :trips, except: [:new, :create]

  resources :passengers do
    resources :trips, only: [:index, :create]
  end

  resources :drivers do
    resources :trips, only: [:index]
  end

  patch 'trips/:id/rating', to: 'trips#add_rating', as: 'add_rating'

end
