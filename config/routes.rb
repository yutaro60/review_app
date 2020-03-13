Rails.application.routes.draw do
  devise_for :users
  root to: 'reviews#index'
  resources :reviews do
    resources :comments, only: :create do
    end
  end
  resources :users, only: :show
end
