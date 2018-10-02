Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get '/passengers', to: 'passengers#index', as: 'passengers'

get '/passengers/new', to: 'passengers#new', as: 'new_passenger'
post '/passengers', to: 'passengers#create'

get '/passengers/:id', to: 'passengers#show', as: 'passenger'

patch '/passengers/:id', to: 'passengers#update'

delete '/passengers/:id', to: 'passengers#destroy'

get '/passengers/:id/edit', to: 'passengers#edit', as: 'edit_passenger'
end 
