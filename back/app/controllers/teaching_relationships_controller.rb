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
    puts "HEITORHEITORIHEITO"
    puts "professors_user #{current_user.professors}"
    user_professors = current_user.professors
    render json: user_professors
  end

  def professors_user_add
    professor = Professor.find_by(name: params[:professor_name])
    @user = User.find_by(name: params[:user_name])

    @user.professors << professor

    if @user.save
      render json: { professor: @user.professors.first.name, message: "Professor added" }, status: :created
    else
      render json: { message: "Professor not added."}, status: :unprocessable_entity
    end
  end
end
