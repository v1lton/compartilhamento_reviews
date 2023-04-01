class SessionsController < ApplicationController
  def new
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
  end
end
