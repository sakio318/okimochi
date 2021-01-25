Rails.application.routes.draw do
  root to: 'homes#top'
  get 'about' => 'homes#about'

  devise_for :users
  resources :users, only:[:index,:show,:edit,:update]

  resources :items do
    resource :favorites, only:[:index,:create,:destroy]
    resources :comments, only:[:create,:destroy]
    resources :reviews, only:[:create,:destroy]
    resources :item_situations, only:[:create,:destroy]
    resources :situations, only:[:create,:destroy]
    resources :post_images, only:[:create, :update, :destroy]
  end

  resources :genres, only:[:create, :destroy]
end
