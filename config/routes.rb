Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movies
  get 'admin/movies', to: 'movies#index'
  get 'admin/movies/:id/edit', to: 'movies#edit'
  get 'admin/movies/new', to: 'movies#new'
  post 'admin/movies', to: 'movies#create'
end