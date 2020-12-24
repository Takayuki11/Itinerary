Rails.application.routes.draw do
  
  get 'toppages/index'
  root "toppages#index"
  
  get "signup", to: "users#new"
  resources :users, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
