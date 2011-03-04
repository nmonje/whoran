Whoran::Application.routes.draw do
  resources :runs

  resources :groups

  devise_for :users

  get "welcome/index"

  resources :memberships
  
  root :to => "welcome#index"
end
