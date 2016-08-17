Rails.application.routes.draw do

  devise_for :owners
  devise_for :costumers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #resources :places
	root 'places#index'
	resources :places do
		resources :comments, only: [:create, :destroy]
    resources :reservs, only: [:create, :update, :destroy]
	end

	resources :categories, only: [:index, :show]

end
