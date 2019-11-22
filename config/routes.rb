Rails.application.routes.draw do
  # get 'coupons/index'
  # get 'profile/show'
  # get 'reviews/index'
  # get 'reviews/new'
  # get 'reviews/create'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root to: 'pages#home'

  resources :restaurants, only: [:index, :show] do
    post 'favorites', to: 'restaurants#toggle_favorites'
  end

  resources :favorites, only: [:index]
  resources :answers, only: [:index, :new, :create]
  resources :reviews, only: [:index, :new, :create]
  resource :profile, only: :show
  resources :coupons, only: :index


  namespace :manager do
    resources :restaurants, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :question_pools, only: [:new, :create, :destroy, :index]
    end
    get 'dashboard', to: 'restaurants#dashboard'
  end

end
