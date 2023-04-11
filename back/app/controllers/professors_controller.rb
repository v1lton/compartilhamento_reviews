class ProfessorsController < ApplicationController
    def index
        @professors = Professor.all
        render json: @professors
    end

    def create
        @professor = Professor.new(name: params[:name])
        if @professor.save
            render json: { professor: @professor, message: "Created professor." }, status: :created
        else
            render json: { message: "Professor not created."}, status: :unprocessable_entity
        end
    end

    def reset
        Professor.destroy_all
        render json: { status: 'ok' }
    end

    def professors_user
        user_professors = current_user.professors
        render json: user_professors
    end
    
end
