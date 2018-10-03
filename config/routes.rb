Rails.application.routes.draw do
  resources :drivers
  resources :passengers
  resources :trips, except: :create, :new

  resources :passengers do
    resources :trips, only: [:create]
  end

end
