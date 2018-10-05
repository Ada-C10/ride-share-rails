Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homepages#index'

  resources :homepages

  resources :passengers do
    resources :trips, only: [:index, :create, :update] 
  end

  resources :drivers do
    resources :trips, only: [:index, :assign_rating]
  end

  resources :drivers, except: [:show]
  resources :passengers, except: [:show]
  resources :trips
end
