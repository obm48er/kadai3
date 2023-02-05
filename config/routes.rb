Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get "/home/about" => "homes#index"
  resources :users
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create]
  end



  end
