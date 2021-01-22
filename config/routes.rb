Rails.application.routes.draw do
  root to: 'homes#top'
  get 'about' => 'homes#about'

  devise_for :users
  resources :users, only:[:index,:show,:edit,:update]

  resources :items do
    resources:favorites, only:[:index,:create,:destroy]
    resources:comments, only:[:create,:destroy]
    resources:reviews, only:[:create,:destroy]
    resources:situations, only:[:create,:destroy]
  end

  resources :genres, only:[:create, :destroy]
  resources :images, only:[:create, :update, :destroy]



end
