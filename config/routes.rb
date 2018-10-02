Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/passengers', to: 'passengers#index', as: 'all_passengers'

  get '/passengers/new', to: 'passengers#new', as: 'new_passenger'
  post "/passengers", to: "passengers#create"


  get '/passengers/:id/edit', to: 'passengers#edit', as: 'edit_passenger'
  patch '/passengers/:id', to: 'tasks#update'



  get '/passengers/:id', to: 'passengers#show', as: 'passenger'
end
