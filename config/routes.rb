Rails.application.routes.draw do
  root "trips#index"

  resources :trips, :drivers, :passengers

  # Nested routes for drivers and passengers to have access to associated trips
  resources :drivers do
    resources :trips, only: [:index, :new]
  end

  resources :passengers do
    resources :trips, only: [:index, :new]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
