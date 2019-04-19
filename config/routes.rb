Rails.application.routes.draw do
  root 'pages#home'

  resources :passengers do
    resources :trips, only: [:create]
  end

  resources :trips, except: [:index, :new]

  resources :drivers

  patch '/drivers/:id/status', to: 'drivers#status', as: 'drivers_status'
end
