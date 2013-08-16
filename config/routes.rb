Social::Application.routes.draw do
  devise_for :users

  root to: 'questions#index'

  resources :home
  resources :users
  resources :questions
  resources :comments
  resources :groups
 
end
