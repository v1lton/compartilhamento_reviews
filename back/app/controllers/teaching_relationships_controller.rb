class TeachingRelationshipsController < ApplicationController
  def create
    professor = Professor.find(params[:professor_id])
    current_user.add_professor(professor)
  end

  def destroy
    professor = Professor.find(params[:id])
    current_user.remove_professor(professor)
  end
end
