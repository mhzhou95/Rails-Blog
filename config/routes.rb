Rails.application.routes.draw do
	root to: "blogs#index"
	resources :blogs
	resources :users
	resources :comments

	get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	post '/logout' => 'sessions#destroy'
end
