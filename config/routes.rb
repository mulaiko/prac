Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:show, :index] do
  	resources :follows, only: [:create, :destroy]
	end

  get 'users/:id', to: 'users#show'
  get 'follow_feed', to: 'users#follow_feed'
	
	root 'users#follow_feed' 
	resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
