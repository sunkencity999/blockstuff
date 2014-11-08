Rails.application.routes.draw do
  
  devise_for :users

  resources :users, only: [:update]

  resources :posts

  
  get "index/decision"

  root to: 'index#decision'

end
