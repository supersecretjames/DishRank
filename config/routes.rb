DishRank::Application.routes.draw do

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  root :to => 'dish_types#index'

  resources :restaurants do
    resources :dishes do
      resources :reviews
    end
  end

  resources :dish_types do 
    resources :dishes, :only => [:index]
  end

  resources :users

  resources :dishes
end
