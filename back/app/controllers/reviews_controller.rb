class ReviewsController < ApplicationController
  def create
    @review = Review.new(user_id: current_user.id, professor_id: params[:professor_id], category_id: params[:category_id], description: params[:description])

    if @review.save
      render json: { review: @review, message: "Created review." }, status: :created
    else
      render json: { message: "Review not created."}, status: :unprocessable_entity
    end
  end

  def index
    reviews = Review.order(created_at: :desc).map do |review|
      {
        user_name: review.user.name,
        professor_name: Professor.find_by_id(review.professor_id).name,
        category_name: Category.find_by_id(review.category_id).name,
        review_content: review.description
      }
    end
    render json: reviews
  end
  

  def reviews_by_user
    @user = User.find(params[:user_id])
    @reviews = @user.reviews
    render json: @reviews
  end

  def reviews_by_category
    category = Category.find_by(name: params[:category_name])
    render json:{ message: "Category not found."}, status: :not_found and return unless category

    reviews = Review.filter_by_category(category.id).map do |review|
      {
        user_name: review.user.name,
        professor_name: Professor.find_by_id(review.professor_id).name,
        category_name: Category.find_by_id(review.category_id).name,
        review_content: review.description
      }
    end
    render json: reviews
  end
end
