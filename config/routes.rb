Rails.application.routes.draw do

  root 'home#top'
  get 'home/about'
  
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  
  devise_for :users

  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
  	resources :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :homes,only:[:top,:about]
 
 end