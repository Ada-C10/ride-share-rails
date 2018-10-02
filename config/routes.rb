Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'home#index'

resources :passengers
resources :drivers
#resources :trips

# get '/drivers', to: 'drivers#index', as: 'drivers' DONE

# get '/drivers/new', to: 'drivers#new', as: 'new_driver' DONE
# post '/drivers', to: 'drivers#create' DONE

# get '/drivers/:id', to: 'drivers#show', as: 'driver' DONE
# #
# patch '/drivers/:id', to: 'drivers#update'
#
# delete '/drivers/:id', to: 'drivers#destroy'
#
# get '/drivers/:id/edit', to: 'drivers#edit', as: 'edit_driver'
end
