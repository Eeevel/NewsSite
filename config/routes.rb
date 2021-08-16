Rails.application.routes.draw do
  root 'articles#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: %i[index show edit update] do
    resources :activities, only: [:index]
    resources :subscriptions, only: %i[index new create destroy]
  end

  resources :articles do
    resources :comments
    resources :ratings
    resources :viewings, only: %i[create]
    resources :charts, only: %i[index]
  end

  resources :tags, only: [:show]
  resources :categories, only: [:show]
  resources :rss, only: [:index], format: 'rss'
  resources :rss_feeds, only: %i[index show new create destroy]
  resources :reports, only: %i[new create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
