Rails.application.routes.draw do
  resources :events do
    member do
      get :rsvp
    end
  end

  devise_for :users
  root to: 'static#home'


end
