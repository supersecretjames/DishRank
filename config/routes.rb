DishRank::Application.routes.draw do

  devise_for :users

  root :to => 'dish_types#index'

  resources :restaurants do
    resources :dishes, :only => [:index, :show, :create, :destroy] do 
      resources :reviews
    end
  end

  resources :dish_types do 
    resources :dishes, :only => [:index, :show] do
      resources :reviews
    end
  end

  resources :users do
    resources :reviews
  end

  resources :dishes
end
