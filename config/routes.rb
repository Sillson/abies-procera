Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :users

  root :to => "home#index"

  get 'gc-api', to: 'gc_api#index'
  get 'project-overview', to: 'gc_api#show' 

  resources :peer_reviews, only: [:index, :show]
  
end
