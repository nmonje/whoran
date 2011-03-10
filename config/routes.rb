Whoran::Application.routes.draw do

  devise_for :users
  resources :runs 
  resources :memberships
  resources :groups
  get "welcome/index"
  
  root :to => "welcome#index"
end
