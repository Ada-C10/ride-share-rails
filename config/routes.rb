Rails.application.routes.draw do
  get 'trips/new'
  get 'trips/create'
  get 'trips/edit'
  get 'trips/update'
  get 'trips/destroy'
  get 'drivers/index'
  get 'drivers/show'
  get 'drivers/edit'
  root 'drivers#index'

  resources :drivers
  resources :passengers
  resources :trips
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
