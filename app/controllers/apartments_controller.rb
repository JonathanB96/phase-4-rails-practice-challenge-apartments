class ApartmentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

    def index 
        apartments = Apartment.all 
        render json: apartments     
    end

    def show
        apartement = Apartment.find(params[:id])
        render json: apartement

    end
    
    def create 
        apartement = Apartment.create(apartement_params)
        render json: apartement, status: :created
    end

    
    def update 
       apartement = Apartment.update(apartement_params)
       render json: apartement 

    end


    def destroy 
        apartement = Apartment.find(params[:id])
        render json: apartement
    end

    private 

    def apartement_params 
        params.permit(:number)
    end

    def not_found_response         
        render json: {error: "Apartment not found"}, status: :not_found
    end




end
