Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :users, :controllers => { registrations: 'registrations' }

  root :to => "home#index"

  get 'gc-api', to: 'gc_api#index'
  get 'project-overview', to: 'gc_api#show' 

  resources :peer_reviews, only: [:index, :show, :create]
  get 'pr-form', to: 'peer_reviews#pr_form'
  
end
