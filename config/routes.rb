Rails.application.routes.draw do
  root "trips#index"
  
  resources :drivers
  resources :passengers
  resources :trips, except: [:create, :new]

  resources :passengers do
    resources :trips, only: [:create]
  end

end
