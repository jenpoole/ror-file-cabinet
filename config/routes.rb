Rails.application.routes.draw do
  get 'welcome/index'

  # view welcome index on main page
  root 'welcome#index'
  
  # create routes for documents
  resources :docs
end
