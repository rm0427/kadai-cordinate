Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create] do
    member do
      get :likes
    end
  end
  
  resources :cordinates, only: [:index, :show, :new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
end
