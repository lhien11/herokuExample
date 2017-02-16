Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  get 'categories/index'

  get 'categories/edit'

  get 'categories/new'

  get 'categories/show'

  root 'home#index'

  get "home/index"

  resources :posts
  resources :categories
  ActiveAdmin.routes(self)


end
