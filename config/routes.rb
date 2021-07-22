Rails.application.routes.draw do
  root 'articles#index'

  resources :articles do
    resources :comments

    collection do
      get 'people'
    end
  end

  resources :tags, only: [:show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
