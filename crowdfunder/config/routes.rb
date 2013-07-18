Crowdfunder::Application.routes.draw do

  resources :users
  resources :projects

  root 'projects#index'
  
end
