Rails.application.routes.draw do
  root to: 'home#index'
  resources :articles, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  get '/signup', to: 'users#new'
  resources :users, except: [:new], only: [:create, :edit, :update, :show, :index]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end