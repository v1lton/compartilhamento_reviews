Rails.application.routes.draw do
  get    'index_professors' => 'sessions#index_professors'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'is_logged'  => 'sessions#is_logged'
  get    'categories' => 'categories#index'
  get    'logged_user' => 'sessions#logged_user'
  delete 'logged_user' => 'sessions#destroy_logged_user'
  patch  'update_logged_user' => 'sessions#update_logged_user'
  get    'reviews_by_category' => 'reviews#reviews_by_category'
  get    'reviews' => 'reviews#index'
  post   'reviews' => 'reviews#create'
  get    'reviews_by_user' => 'reviews#reviews_by_user'
  get    'professors' => 'professors#index'
  get    'professors_by_user' => 'teaching_relationships#professors_user'

  #Testing only:
  get    'test/categories/reset' => 'categories#reset'
  post   'test/categories' => 'categories#create'
  get    'test/professors/reset' => 'professors#reset'
  post   'test/professors' => 'professors#create'
  get    'test/reviews/reset' => 'reviews#reset'
  post   'test/reviews' => 'reviews#create_test'
  get    'test/users/reset' => 'users#reset'
  post   'test/users' => 'users#create_test'
  post   'test/professors_user_add' => 'teaching_relationships#professors_user_add'

  resources :users do
    resources :reviews, only: [:index, :create]
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :teaching_relationships, only: [:create, :destroy]
end
