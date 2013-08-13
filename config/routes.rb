Social::Application.routes.draw do
  devise_for :users

  root to: 'users#index'

  resources :home
  resources :users
  resources :questions
  resources :comments
  resources :groups
 
end
