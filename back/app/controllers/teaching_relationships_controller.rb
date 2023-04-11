class TeachingRelationshipsController < ApplicationController
  def create
    professor = Professor.find(params[:professor_id]) #não tem como pegar o id do professor, tem que pegar o nome que foi colocado no input
    current_user.add_professor(professor)
  end

  def destroy
    professor = Professor.find(params[:id])
    current_user.remove_professor(professor)
  end

  def professors_user
    user_professors = current_user.professors
    render json: user_professors
  end
end
