Rails.application.routes.draw do
   get '/home', to: 'home#index'
   root 'home#index'

  resources :drivers

  resources :trips

  resources :passengers do
    resources :trips, only: [:create]
  end
end
