Rails.application.routes.draw do
 root to: 'homes#top'
  get "home/about"=>"homes#about", as: "about"
 devise_for :users
 devise_for :admins
 resources :users, only: [:index,:show,:edit,:update]
  resources :illusts, only: [:new,:index,:show,:edit,:create,:destroy,:update]do
  resource :favorites, only: [:create, :destroy]
 end
  get 'users/create'
  get 'users/destroy'
   devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :tags do
    get 'illusts', to: 'illusts#search'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
