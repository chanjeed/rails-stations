Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/admin' do
    resources :movies
    get 'movies/:id/edit', to: 'movies#edit'
    patch 'movies/:id/edit', to: 'movies#update'
  end
  
end