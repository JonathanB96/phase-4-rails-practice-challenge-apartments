class TenantsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_response
    def index 
        tenants = Tenant.all 
        render json: tenants     
    end

    def show
        tenant = Tenanr.find(params[:id])
        render json: tenant

    end
    
    def create 
        tenant = Tenant.create(tenant_params)
        render json: tenant, status: :created
    end

    
    def update 
       tenant = Tenant.update(tenant_params)
       render json: tenant 

    end


    def destroy 
        tenant = Tenant.find(params[:id])
        render json: tenant
    end

    private 

    def invalid_response
        render json: { errors: ["Invalid data!"]}, status: :unprocessable_entity
    end

    def tenant_params 
        params.permit(:name, :age)
    end

    def not_found_response         
        render json: {error: "Tenant not found"}, status: :not_found
    end

   

end
