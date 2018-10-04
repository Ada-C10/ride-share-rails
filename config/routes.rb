Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'

  resources :passengers
  resources :drivers
  resources :trips

  resources :passengers do
    resources :trips, only: [:index, :new]
  end

end
