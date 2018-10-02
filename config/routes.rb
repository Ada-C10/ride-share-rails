Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root '#'



  #patch 'complete/tasks/:id', to: 'tasks#complete', as: 'complete_task'

  resources :passengers, :drivers, :trips

end
