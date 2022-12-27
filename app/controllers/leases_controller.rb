class LeasesController < ApplicationController
  def create
    new_lease = Lease.create!(lease_params)
    render json: new_lease, status: :accepted
  end

  def destroy
    lease = Lease.find_by!(id: params[:id])
    lease.destroy
    head :no_content
  end

  private

  def lease_params
    params.permit(:rent)
  end

  def lease_not_found_response
    render json: { error: invalid.record.error }, status: :not_found
  end
end
