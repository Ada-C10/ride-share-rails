Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homes#index'

  get '/homes', to: 'homes#index'
  resources :trips, except: [:new, :create]

  resources :passengers do
    resources :trips, only: [:index, :create]
  end

  resources :drivers do
    resources :trips, only: [:index]
  end

  post 'drivers/:id/make_available', to: 'drivers#make_available', as: 'available'

  post 'drivers/:id/make_unavailable', to: 'drivers#make_unavailable', as: 'unavailable'

end
