Rails.application.routes.draw do

  get 'toppages/index'
  root "toppages#index"
  
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get "signup", to: "users#new"
  resources :users do
    member do
      get :followings
      get :followers
      get :likes
    end
  end
  
  resources :relationships, only: [:create, :destroy]
  
  resources :favorites, only: [:create, :destroy]
  
  # Picturesはまだ探索中
  resources :places, only: [:index, :show, :new, :create, :destroy] do
    get :search, on: :collection
    resources :pictures, only: [:index, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
