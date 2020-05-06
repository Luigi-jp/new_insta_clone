Rails.application.routes.draw do
  

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  devise_scope :user do
    get 'change', to: 'users/registrations#change'
  end
  
  root 'pages#index'
  resources :users, only: :show
  resources :posts, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
