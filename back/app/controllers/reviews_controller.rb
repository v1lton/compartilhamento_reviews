class ReviewsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @review = @user.review.new(description: params[:description], professor_id: params[:professor_id], category_id: params[:category_id])

    if @review.save
      render json: { review: @review, message: "Created review." }, status: :created
    else
      render json: { message: "Review not created."}, status: :unprocessable_entity
    end
  end

  def index
    @user = User.find(params[:user_id])
    @reviews = @user.reviews
    render json: @reviews
  end

  def reviews_by_category
    category = Category.find_by(name: params[:category_name])
    render json:{ message: "Category not found."}, status: :not_found and return unless category

    @reviews = Review.filter_by_category(category)
    render json: @reviews
  end
end
