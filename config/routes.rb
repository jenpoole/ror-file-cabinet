Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  # view welcome index on main page
  root 'welcome#index'
  
  # create routes for documents
  resources :docs
end
