Crowdfunder::Application.routes.draw do

	get "logout" => "sessions#destroy", :as => "logout"
	get "login" => "sessions#new", :as => "login"
	get "signup" => "users#new", :as => "signup"

	resources :users
	resources :sessions
	
	resources :projects do
		resources :pledges
	end

	namespace :my do
		resources :projects
	end

	root 'projects#index'

end
