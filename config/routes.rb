Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homepages#index'

  resources :homepages

  resources :drivers do
    resources :trips
  end

  resources :passengers do
    resources :trips
  end


  resources :drivers
  resources :passengers
end
