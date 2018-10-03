Rails.application.routes.draw do
  # root - TODO  create a controller and view for the homepage to redirect
  # after deleting a passenger (passenger list or  homepage?)

  resources :trips, :drivers, :passengers

  # Nested routes for drivers and passengers to have access to trips
  resources :drivers do
    resources :trips, only: [:index, :new]
  end

  resources :passengers do
    resources :trips, only: [:index, :new]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
