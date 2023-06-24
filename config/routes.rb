Rails.application.routes.draw do
 root to: 'homes#top'
  get "home/about"=>"homes#about", as: "about"
 devise_for :users
 devise_for :admins, controllers: {sessions: 'admins/sessions'}

 resources :users, only: [:index,:show,:edit,:update]do
 resource :relationships, only: [:create, :destroy]
    get "followings" => "relationships#followings", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
 end
  resources :illusts, only: [:new,:index,:show,:edit,:create,:destroy,:update]do
  resource :favorites, only: [:create, :destroy]
  resources :illust_comments, only: [:create, :destroy]
 end
  # get 'users/create'
  # get 'users/destroy'
   devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :tags do
    get 'illusts', to: 'illusts#search'
  end

 namespace :admin do
  root to: 'homes#top'
  resources :users, only: [:index,:show]
   resources :illusts, only: [:index,:show,:destroy]do
  resource :favorites, only: [:create, :destroy]
  resources :illust_comments, only: [:create, :destroy]
 end
  resources :tags do
    get 'illusts', to: 'illusts#search'
  end
end
get "search" => "searches#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
