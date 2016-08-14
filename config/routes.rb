Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #resources :places
	root 'places#index'
	resources :places
	resources :categories, only: [:index, :show]
  
end
