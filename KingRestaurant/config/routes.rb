Rails.application.routes.draw do
  resources :food_items
	root 'pages#home'
	get '/contact', to: 'pages#contact'
	get '/about', to: 'pages#about'
end
