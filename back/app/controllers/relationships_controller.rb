class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
  end

  def destroy
    other_user = User.find_by(id: params[:id])
    current_user.unfollow(other_user )
  end
end