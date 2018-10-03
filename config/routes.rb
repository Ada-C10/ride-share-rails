Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #make a root page for home 

  resources :drivers
  resources :trips
  resources :passengers

end
