Rails.application.routes.draw do
  root 'trips#home'

  resources :passengers do
  get '/trips/:id/in_progress', to: 'trips#in_progress', as: 'trip_inprogress'
    resources :trips, only:  [:create, :show]

  end

  resources :drivers

  get 'trips/home', to: 'trips#home', as: 'trips_home'
  resources :trips

end
