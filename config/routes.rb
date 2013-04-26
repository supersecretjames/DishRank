DishRank::Application.routes.draw do
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

  root :to => 'dish_types#index'
end
