Rails.application.routes.draw do
  resources :orders
  resources :line_items
  patch 'line_item_increase/:id', to: 'line_items#increase_quantity', as:"line_item_increase"
  patch 'line_item_decrease/:id', to: 'line_items#decrease_quantity', as:"line_item_decrease"
  resources :carts, only: [:destroy]
  get '/my_cart', to: 'carts#show'
  resources :food_items  do  	
  	resources :reviews, only: [:new, :create]
  end
	root 'pages#home'
	get '/contact_us', to: 'pages#contact_us'
	get '/menu', to: 'sections#index'
end
