Rails.application.routes.draw do
  root 'pages#home'
  resources :drivers
<<<<<<< HEAD
  resources :passengers do
    resources :trips, only: [:index, :new]
  end
  resources :trips
  # custom route to create a new trip with params of driver and passenger id's?
=======
  resources :passengers
  resources :trips, except: [:index, :new]

  resources :drivers do
    resources :trips, only: [:show]
  end
>>>>>>> 7f55b539064611065a73f87105d0b8ca4458aba1
end
