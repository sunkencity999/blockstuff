Rails.application.routes.draw do
  
  get "index/decision"

  root to: 'index#decision'

end
