Rails.application.routes.draw do
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
    resources :restaurants, only: [:new, :create, :edit, :update, :destroy, :index, :show]
  end

end
