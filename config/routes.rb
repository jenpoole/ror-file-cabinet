Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  get 'welcome/index'

  # create routes for documents
  resources :docs
  
  # main page for logged-in users
  authenticated :user do
    root 'docs#index', as: 'authenticated_root'
  end
  
  # view welcome index on main page
  root 'welcome#index'
  
end
