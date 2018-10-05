Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'


  resources :trips
  resources :passengers
   resources :passengers, except: :destroy  do
    resources :trips, only: :create
    member do
      get :trips
    end
  end
  resources :drivers
  get '/home', to: 'home#index', as: 'home'
end
