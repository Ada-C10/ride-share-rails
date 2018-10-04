Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'rideshare#index'

  resources :rideshare, only:[:index]
  resources :drivers
  resources :trips
  resources :passengers do
    resources :trips, only: [:create]
      post 'assign_driver'
  end
end
