class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: render_not_found_response

  def index
    campers = Camper.all
    render json: campers
  end

  def show
    camper = Camper.find(params[:id])
    render json: camper
  end

  def create
    camper = Camper.create!(params.permit(:name, :age))
    render json: camper, status: :created
  end

  private

  def render_not_found_response
    render json: {error: "Camper not found"}, status: :not_found
  end
end
