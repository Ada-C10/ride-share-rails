Rails.application.routes.draw do
  # root - TODO  create a controller and view for the homepage to redirect
  # after deleting a passenger (passenger list or  homepage?)

  resources :trips, :drivers, :passengers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
