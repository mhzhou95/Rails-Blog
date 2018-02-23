Rails.application.routes.draw do
	root to: "blogs#index"
	resources :blogs do 
		resources :comments
	end
	resources :users
	

	get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	post '/logout' => 'sessions#destroy'
end
