Rails.application.routes.draw do
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'layouts#application'
  get   'welcome/index', to: 'welcome#index', as: 'welcome_index'
  resources :trips
  resources :passengers, :drivers do
    resources :trips
  end

end
