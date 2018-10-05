Rails.application.routes.draw do
  root 'trips#home'
  get 'trips/home', to: 'trips#home', as: 'trips_home'
  resources :trips
  
  resources :passengers do
  get '/trips/:id/in_progress', to: 'trips#in_progress', as: 'trip_inprogress'
    resources :trips, only:  [:create, :show]
  end

  resources :drivers
  get '/trips/:id/in_progress', to: 'trips#in_progress', as: 'trip_inprogress'
  patch '/trips/:id/in_progress', to: 'trips#end_trip'
    resources :trips, only:  [:create, :show, :destroy]



end
