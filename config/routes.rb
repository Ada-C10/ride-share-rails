Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :passengers, :drivers, :trips
  resources :drivers do
    resources :trips, include: [:index, :show]
  end

  # NOTE: added nested routes for passengers+trips
  resources :passengers do
    resources :trips, include: [:index, :show, :new, :delete]
  end

end
