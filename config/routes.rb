Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#show", page: "home"

  resources :passengers, :drivers

  resources :trips, except: [:index, :edit]

  get "/pages/:page" => "pages#show"

  post "/passengers/:passenger_id/trips/", to: 'trips#create', as: 'create_passenger_trip'

end
