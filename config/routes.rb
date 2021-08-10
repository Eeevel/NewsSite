Rails.application.routes.draw do
  root 'articles#index'

  devise_for :users
  resources :users, only: %i[index show edit update] do
    resources :activities, only: [:index]
  end

  resources :articles do
    resources :comments
    resources :ratings
    resources :viewings, only: %i[create]
  end

  resources :tags, only: [:show]
  resources :categories, only: [:show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
