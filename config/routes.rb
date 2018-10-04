Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'trips#index'

    # Auto-generate all the RESTful routes
    resources :trips
    resources :drivers
    resources :passengers



    patch '/drivers/:id/complete', to: 'drivers#complete', as: 'driver_status'


end
