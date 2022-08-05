Rails.application.routes.draw do
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
    
  }
  # get '/users', to: 'users#index'

  resources :portfolios
  resources :tickers
  
end
