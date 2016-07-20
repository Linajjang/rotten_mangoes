RottenMangoes::Application.routes.draw do

  resources :posts
  resources :movies do
    resources :reviews, only: [:new, :create]
  end
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  root to: 'movies#index'

  namespace :admin do 
    resources :users, only: [:new, :index, :create, :edit, :show, :update]
  end
end
