Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'layouts#application'

  resources :passengers, :drivers, :trips
  #
  # this is get '/authors/:author_id/books', to: 'books#authors '
  # resources:authors do
  #   resources :books, only :[index, :new]

end
