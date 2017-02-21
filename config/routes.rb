Rails.application.routes.draw do
  get 'pages/about'

  get 'pages/contact'

  get 'pages/resources'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'categories/index'

  get 'categories/edit'

  get 'categories/new'

  get 'categories/show'

  root 'home#index'

  get "home/index"

  resources :posts
  resources :categories
  get '/about' , :to => 'pages#about'
  get '/contact' , :to => 'pages#contact'
  get '/resources' , :to => 'pages#resources'



end
