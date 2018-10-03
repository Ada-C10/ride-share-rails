Rails.application.routes.draw do
  root 'welcome#index'
  
  get 'welcome/index'
  get 'trips/:id', to: 'trips#show', as: 'trip'
  get 'trips/:id/edit', to: 'trips#edit', as: 'edit_trip'
  patch 'trips/:id', to: 'books#update'
  delete 'trips/:id', to: 'trips#destroy'

  resources :drivers

  resources :passengers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
