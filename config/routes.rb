Rails.application.routes.draw do
  root 'passengers#index'
  # root 'Passengers#index'
  resources :passengers

end
