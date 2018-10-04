Rails.application.routes.draw do
  root 'welcome#index'

  get 'welcome/index'
  # why are the paths different between resource trips and the trips I wrote?
  resources :trips

  resources :drivers

  resources :passengers

  resources :passengers do
    resources :trips, only: [:index, :new, :create]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
