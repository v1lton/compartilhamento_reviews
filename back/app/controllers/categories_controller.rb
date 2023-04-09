class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render json: @categories
  end

  def create
    @category = Category.new(name: params[:name])
    if @category.save
      render json: { category: @category, message: "Created category." }, status: :created
    else
      render json: { message: "Category not created."}, status: :unprocessable_entity
    end
  end

  def reset
    Category.destroy_all
    render json: { status: 'ok' }
  end
end
