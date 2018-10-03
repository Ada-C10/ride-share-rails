Rails.application.routes.draw do
  root 'pages#home'
  resources :drivers
  resources :passengers
  resources :trips, except: [:index, :new]
end
