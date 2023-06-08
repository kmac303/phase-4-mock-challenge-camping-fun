class SignupsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def create
    signup = Signup.create!(params.permit(:time, :camper_id, :activity_id))
    render json: signup.activity, status: :created
  end

  private

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
end
