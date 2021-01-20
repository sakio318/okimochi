Rails.application.routes.draw do
  root to: 'homes#top'
  get 'about' => 'homes#about'
  devise_for :users
  
  resources :items do
    resources:favorites, only:[:create,:destroy]
    resources:comments, only:[:create,:destroy]
    resources:reviews, only:[:create,:destroy]
  end
  
  resources :genres, only:[:create, :destroy]
  resources :images, only:[:create, :update, :destroy]
  
  

end
