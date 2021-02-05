Rails.application.routes.draw do
  root to: 'homes#top'
  get 'about' => 'homes#about'
  get "search" => "items#search"

  devise_for :users, controllers:{
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users, only:[:index,:show,:edit,:update] do
    member do
      get 'favo_index'
  end
end

  resources :items do
    resource :favorites, only:[:index,:create,:destroy]
    resources :comments, only:[:create,:destroy]
    resources :item_situations, only:[:create,:destroy]
    resources :situations, only:[:create,:destroy]
    resources :post_images, only:[:create, :update, :destroy]
  end
resources :genres, only:[:create, :destroy]

end
