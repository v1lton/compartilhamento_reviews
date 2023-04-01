class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]
  before_action :logged_in_user, only: %i[update destroy]
  before_action :correct_user, only: %i[update destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_update_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :email, :name, :surname, :pronouns, :country, :password, :password_confirmation)
  end

  # Only allow a list of trusted parameters for updating.
  def user_update_params
    params.require(:user).permit(:email, :name, :surname, :pronouns, :country, :password, :password_confirmation)
  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      render json: { message: "Please login" }, status: :forbidden
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    render json: { message: "You are not the correct user" }, status: :forbidden unless current_user?(@user)
  end
end
