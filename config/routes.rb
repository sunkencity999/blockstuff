Rails.application.routes.draw do
  
  resources :posts

  get "index/decision"

  root to: 'index#decision'

end
