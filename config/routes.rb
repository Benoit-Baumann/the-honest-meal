Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:index, :show] do
    post 'favorites', to: 'restaurants#toggle_favorites'
  end

  resources :favorites, only: [:index]
  resources :reviews, only: [:new, :create, :index] #index for my_reviews
  resource :profile, only: :show
  resources :coupons, only: :index

  namespace :manager do
    resources :restaurants, only: [:new, :create, :edit, :update, :destroy, :index, :show]
  end
end
