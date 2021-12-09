Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  get 'home/show'
  resources :events
  resources :jobs

  get '/share/:user/create', action: :create, controller: 'public_share'
  get '/share/:user/remove', action: :remove, controller: 'public_share'
  get '/share/:user/:token', action: :show, controller: 'public_share'
  
  root to: "jobs#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
