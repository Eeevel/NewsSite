Rails.application.routes.draw do
  root 'articles#index'

  devise_for :users
  resources :users, only: %i[index show edit update] do
    resources :activities, only: [:index]
    resources :subscriptions, only: %i[index new create destroy]
  end

  resources :articles do
    resources :comments
    resources :ratings
    resources :viewings, only: %i[create]
  end

  resources :tags, only: [:show]
  resources :categories, only: [:show]
  resources :rss, only: [:index], format: 'rss'
  resources :rss_feeds, only: %i[index show new create destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
