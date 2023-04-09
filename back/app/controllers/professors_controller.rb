class ProfessorsController < ApplicationController
    def index
        @professors = Professor.all
        render json: @professors
    end
end
