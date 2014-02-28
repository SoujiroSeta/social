  Social::Application.routes.draw do
  

  mount Ckeditor::Engine => '/ckeditor'

  get "super_admin/index"

  get "super_admin/update"

  get "super_admin/destroy"

  get "search/index"

  resources :votes


  devise_for :users

  root to: 'questions#index'

  resources :super_admin, only: [:index, :update, :destroy]
  resources :home
  resources :users
  resources :questions
  resources :comments
  resources :groups
 	resources :tags
 	resources :reputations
end
