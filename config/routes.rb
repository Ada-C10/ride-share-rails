Rails.application.routes.draw do
  root 'passengers#index'
  # root 'Passengers#index'
  resources :passengers do
    resources :trips, only: [:index, :new, :create]
  end

  resources :drivers do
    resources :trips, only: [:index]
  end

  resources :trips

end
