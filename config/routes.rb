Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # assigning temp root to the drivers page, replace with the homepage once its set up
  root 'passengers#index'


  resources :trips

  resources :drivers do
    resources :trips, only: [:index]
  end

  resources :passengers do
    resources :trips, only: [:index, :new, :create]
  end
end
