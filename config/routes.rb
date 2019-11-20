Rails.application.routes.draw do
  get 'coupons/index'
  get 'profile/show'
  get 'reviews/index'
  get 'reviews/new'
  get 'reviews/create'
  devise_for :users

  root to: 'pages#home'

  resources :restaurants, only: [:index, :show] do
    post 'favorites', to: 'restaurants#toggle_favorites'
  end

  resources :favorites, only: [:index]
  resources :reviews, only: [:index, :new, :create] #index for my_reviews
  resource :profile, only: :show
  resources :coupons, only: :index


  namespace :manager do
    resources :restaurants, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end

end
