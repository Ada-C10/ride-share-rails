Rails.application.routes.draw do
  get 'passengers/index'
  get 'passengers/show'
  get 'passengers/edit'
  get 'passengers/new'
  get 'trips/index'
  get 'trips/show'
  get 'trips/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
