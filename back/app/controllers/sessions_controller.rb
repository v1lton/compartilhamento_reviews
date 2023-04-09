class SessionsController < ApplicationController

  def logged_user
    @user = current_user
    render json: @user
  end

  def update_logged_user
    @user = current_user
    if @user.update(user_update_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in user
      render json: user
    else
      render json: { message: "Invalid email/password combination" }, status: :not_found
    end
  end

  def destroy
    log_out if logged_in?
    render json: { message: "Success" }, status: :accepted
  end

  def is_logged
    if logged_in?
      render json: { logged: true }, status: :accepted
    else
      render json: { logged: false }, status: :not_found
    end
  end

  private
  def user_update_params
    params.require(:user).permit(:email, :name, :surname, :pronouns, :country, :password, :password_confirmation)
  end
end
