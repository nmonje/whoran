Whoran::Application.routes.draw do

  devise_for :users
  resources :runs
  resources :groups
  resources :memberships
  get "welcome/index"
  
  root :to => "welcome#index"
end
