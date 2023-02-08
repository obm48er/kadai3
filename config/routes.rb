Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get "/home/about" => "homes#index"
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]

  end
  get "followlists" => "follow_lists#followed"
  get 'relationships/followings'
  get 'relationships/followers'

  end
