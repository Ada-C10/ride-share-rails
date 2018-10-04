Rails.application.routes.draw do
  root 'welcome#index'

  get 'welcome/index'
  # resource :trips do
  #   resources :drivers, only: [:index, :new]
  get 'trips/:id', to: 'trips#show', as: 'trip'
  get 'trips/:id/edit', to: 'trips#edit', as: 'edit_trip'
  patch 'trips/:id', to: 'books#update'
  delete 'trips/:id', to: 'trips#destroy'

  resources :drivers

  resources :passengers

  resources :passengers do
    resources :trips, only: [:index, :new, :create]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
