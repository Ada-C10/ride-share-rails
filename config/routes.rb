Rails.application.routes.draw do
  root 'pages#home'

  resources :passengers do
    resources :trips, only: [:create]
  end

  resources :trips, except: [:index, :new]

  resources :drivers
end
