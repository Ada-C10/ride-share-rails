Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'


  resources :passengers, :trips, :drivers



  resources :drivers do
    resources :trips, include: [:index, :show]
  end

<<<<<<< HEAD
  # NOTE: added nested routes for passengers+trips
  resources :passengers do
    resources :trips, include: [:index, :show, :new, :delete]
  end
=======
  
>>>>>>> bc7346cbb706496830052886e3d245aa36eda31f

end
