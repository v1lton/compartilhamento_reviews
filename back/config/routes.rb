Rails.application.routes.draw do
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'is_logged'  => 'sessions#is_logged'
  get    'categories' => 'categories#index'
  get    'logged_user' => 'sessions#logged_user'
  patch  'update_logged_user' => 'sessions#update_logged_user'
  get    'reviews_by_category' => 'reviews#reviews_by_category'
  get    'reviews' => 'reviews#index'
  post   'reviews' => 'reviews#create'
  get    'reviews/:user_id' => 'reviews#reviews_by_user'
  get    'professors' => 'professors#index'
  #Testing only:
  get    'test/categories/reset' => 'categories#reset'
  post   'test/categories' => 'categories#create'
  get    'test/professors/reset' => 'professors#reset'
  post   'test/professors' => 'professors#create'
  get    'test/reviews/reset' => 'reviews#reset'
  post   'test/reviews' => 'reviews#create_test'
  get    'test/users/reset' => 'users#reset'
  post   'test/users' => 'users#create_test'

  resources :users do
    resources :reviews, only: [:index, :create]
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end
