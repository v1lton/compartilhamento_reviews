Rails.application.routes.draw do
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'is_logged'  => 'sessions#is_logged'
  get    'categories' => 'categories#index'
  get    'logged_user' => 'sessions#logged_user'
  patch  'update_logged_user' => 'sessions#update_logged_user'
  get    'reviews_by_category' => 'reviews#reviews_by_category'
  resources :users do
    resources :reviews, only: [:index, :create]
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end
