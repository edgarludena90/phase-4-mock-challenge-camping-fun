class CampersController < ApplicationController
  
  def index
    campers = Camper.all
    render json:  campers
  end

  def show
    campers = Camper.find_by(id: params[:id])
    if campers
      render json: campers
    else
      render json: { error: "Camper not found " }, status: :not_found
    end
  end
  def create
    campers = Camper.create(camper_params)
    render json: campers, status: :created
  end
   private
  def camper_params
    params.permit(:name,:age)
  end
end
