Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #resources :places
  get 'places/new', to: 'places#new'
  post 'places', to: 'places#create'

  get 'places', to: 'places#index'
  get 'places/:id', to: 'places#show', as: 'place'

  get 'places/:id/edit', to: 'places#edit', as: 'edit_place'
  post '/places/:id', to: 'places#update', as: 'update_place'
  
  
  root 'places#index'
end
