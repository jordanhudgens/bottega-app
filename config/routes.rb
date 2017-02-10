Rails.application.routes.draw do
  
  mount ActionCable.server => '/cable'

  resources :events
  devise_for :users
  root to: 'static#home'
end
