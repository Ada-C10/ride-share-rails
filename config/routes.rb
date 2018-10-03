Rails.application.routes.draw do
  root 'pages#home'
  resources :drivers
  resources :passengers
  resources :trips
  # custom route to create a new trip with params of driver and passenger id's?
end
