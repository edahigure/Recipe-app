Rails.application.routes.draw do   devise_for :users
  resources :shopping_list, only: %i[index]
  resources :foods
  resources :recipe_foods, only: %i[create destroy]
  resources :recipes
  resources :users
  resources :public_recipes
  resources :shopping_list

  #root to users#index acceced as public_recipes
  
  root to: 'public_recipes#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end

