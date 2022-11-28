Rails.application.routes.draw do

 root to: 'homes#about'

 devise_for :admins, controllers: {
  sessions: "admins/sessions"
 }

 devise_for :users, controllers: {
  sessions: 'users/sessions',
  passwords: 'users/passwords',
  registrations: 'users/registrations'
 }

 get "/home/about" => "homes#about"
 resources :searches, only: [:new] do
  collection do
      get :search
  end
 end

 scope module: :users do
   resources :topics, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :topic_comments, only: [:create, :destroy]
   end
   resources :my_pages, only: [:show, :edit, :update]
   resources :users do
    resource :relationships, only: [:create, :destroy]
    # post 'follow/:id' => 'relationships#follow', as: 'follow'
    # post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
   end
 end

namespace :admins do
  resources :topics, only: [:new, :create, :edit, :update, :destroy, :index, :show,]
  resources :users, only: [:index, :show ,:destroy]
end

end
