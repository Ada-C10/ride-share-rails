Rails.application.routes.draw do
  root 'pages#home'

  resources :passengers do
    resources :trips, only: [:create, :destroy]
  end

  resources :trips, except: [:index, :new]

  resources :drivers do
    resources :trips, only: [:show, :destroy]
  end
end
