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

  get "search" => "searches#search"

end
