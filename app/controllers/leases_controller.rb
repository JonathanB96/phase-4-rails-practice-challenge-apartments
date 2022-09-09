class LeasesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
    def create 
        lease = Lease.create(lease_params)     
        render json: lease, status: :created   
    end

    def destroy 
        lease = Lease.find(params[:id])
        lease.destroy
        head :no_content

    end

    private 

    def lease_params 
        params.permit(:rent, :apartment_id, :tenant_id)
    end

    def not_found_response         
        render json: {error: "Apartment not found"}, status: :not_found
    end



end
