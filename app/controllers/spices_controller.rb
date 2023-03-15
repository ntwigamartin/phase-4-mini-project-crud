class SpicesController < ApplicationController
    def index
        render json: Spice.all, except: [:created_at, :updated_at]
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, except: [:created_at, :updated_at], status: :created
    end

    def update
        spice = Spice.find_by(id:params[:id])
        spice.update(spice_params)
        render json: spice, except: [:created_at, :updated_at], status: :ok
    end

    def destroy
        spice = Spice.find_by(id:params[:id])
        spice.destroy
        head :no_content
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
