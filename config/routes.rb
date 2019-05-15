Rails.application.routes.draw do

  root to: 'home#index'

  get '/signup', to: 'users#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :articles, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :users, except: [:new], only: [:create, :edit, :update, :show, :index, :destroy]
  resources :categories

end