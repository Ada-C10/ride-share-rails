Rails.application.routes.draw do
  root 'trips#home'
  resources :trips, except: [:create, :new]
  resources :drivers
  resources :passengers, except: [:show] do
    resources :trips, only: [:index, :show, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
