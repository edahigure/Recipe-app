Rails.application.routes.draw do
  devise_for :users
  resources :recipe_foods
  resources :foods
  resources :recipes
  resources :users

  #root to users#index acceced as public_recipes
  root to: 'users#index', as: 'public_recipes'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :public_recipes
  
end

