class ApartmentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :apartment_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :apartment_not_created_response

  def index
    apartments = Apartment.all
    render json: apartments, status: :ok
  end

  def show
    apartment = Apartment.find_by!(id: params[:id])
    render json: apartment, status: :ok
  end

  def create
    new_apartment = Apartment.create!(apartment_params)
    render json: new_apartment, status: :created
  end

  def update
    apartment = Apartment.find_by!(apartment_params)
    render json: apartment, status: :accepted
  end

  def destroy
    apartment = Apartment.find_by!(apartment_params)
    apartment.destroy
    head :no_content
  end

  private

  def apartment_params
    params.permit(:number)
  end

  def apartment_not_found_response
    render json: { error: "Apartment not found" }, status: :not_found
  end

  def apartment_not_created_response
    render json: { error: "Validation error" }, status: :unprocessable_entity
  end
end
