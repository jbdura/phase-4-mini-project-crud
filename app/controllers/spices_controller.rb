class SpicesController < ApplicationController
    wrap_parameters format: []

    # GET /spices
    def index
        spices = Spice.all
        render json: spices
    end

    # GET /spices/:id
    def show
        spice = Spice.find_by(id: params[:id])
        if spice
            render json: spice, status: :ok
        else
            render json: { error: "Spice not found" }, status: :not_found
        end
    end

    # POST /spices
    def create
        spice = Spice.create(spices_params)
        render json: spice, status: :created
    end


    # PATCH /spices/:id
    def update
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.update(spices_params)
            render json: spice, status: :accepted
        else
            render json: { error: "spice not found" }, status: :not_found
        end
    end

    # DELETE /spices/:id
    def destroy
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.destroy
            render json: []
        else
            render json: { error: "spice not found" }, status: :not_found
        end
    end


    private

    # def spice_finder
    #     Spice.find_by(params[:id])
    # end

    # def spice_update
    #     params.admit()
    # end
    
    def spices_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

end
