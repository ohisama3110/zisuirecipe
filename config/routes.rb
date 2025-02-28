Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'homes/about', to: 'homes#about', as: 'about'
  resources :users, only: [:show, :edit, :update]
  resources :recipes
  get 'mypage', to: 'users#mypage'
  resources :users do
    member do
      delete 'destroy_account', to: 'users#destroy', as: 'destroy_account'
    end
  end

  resources :recipes do
    resources :comments, only: [:create, :destroy]
  end

  get "search" => "searches#search"

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:index, :destroy]
    resources :groups, only: [:index, :destroy]
  end

  resources :groups
end
