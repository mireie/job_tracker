Rails.application.routes.draw do
  devise_for :users
  get "home/index"
  get "home/show"
  resources :events
  get "jobs/quick-add", action: :quick_add, controller: "jobs"
  get "jobs/ignore-old-jobs", action: :ignore_old_jobs, controller: "jobs"
  resources :jobs do
    resources :notes
  end

  get "/share/:user/create", action: :create, controller: "public_share", as: "share_create"
  get "/share/:user/remove", action: :remove, controller: "public_share", as: "share_remove"
  get "/share/:user/:token", action: :show, controller: "public_share", as: "share_show"
  get "quick-add", action: :quick_add, controller: "jobs", as: "quick_add"

  root to: "jobs#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
