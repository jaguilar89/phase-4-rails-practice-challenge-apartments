class TenantsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :tenant_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :tenant_not_created_response

  def index
    tenants = Tenant.all
    render json: tenants, status: :ok
  end

  def show
    tenant = Tenant.find_by!(id: params[:id])
    render json: tenant, status: :ok
  end

  def create
    new_tenant = Tenant.create!(tenant_params)
    render json: new_tenant, status: :created
  end

  def update
    tenant = Tenant.find_by!(id: params[:id])
    tenant.update!(tenant_params)
    render json: tenant, status: :accepted
  end

  def destroy
    tenant = Tenant.find_by!(params[:id])
    tenant.destroy
    head :no_content
  end

  private

  def tenant_params
    params.permit(:name, :age)
  end

  def tenant_not_found_response
    render json: { error: "not found" }, status: :not_found
  end

  def tenant_not_created_response
    render json: { error: invalid.record.error }, status: :unprocessable_entity
  end
end
