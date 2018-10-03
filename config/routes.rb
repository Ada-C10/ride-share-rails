Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

<<<<<<< HEAD
  # make a root page for home 
=======
  #make a root page for home
  root 'homes#index'

  get '/homes', to: 'homes#index'
>>>>>>> ac0a8fc3d7b415a15f498c753d14eebbe39f5dd4

  resources :drivers
  resources :trips
  resources :passengers

end
