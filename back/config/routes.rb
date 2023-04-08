Rails.application.routes.draw do
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'is_logged'  => 'sessions#is_logged'
  get    'categories' => 'categories#index'
  get    'logged_user' => 'sessions#logged_user'
  patch  'update_logged_user' => 'sessions#update_logged_user'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end
