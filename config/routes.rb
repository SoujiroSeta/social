Social::Application.routes.draw do

  get "search/index"

  resources :votes


  devise_for :users

  root to: 'questions#index'

  resources :home
  resources :users
  resources :questions
  resources :comments
  resources :groups
 	resources :tags
 	resources :reputations
end
