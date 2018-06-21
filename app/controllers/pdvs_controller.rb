class PdvsController < ApplicationController
  def create
    @pdv = Pdv.new(pdv_params)
    @pdv.save
    render json: { pdv: @pdv, successful: true }
  end

  def show
    @pdv = Pdv.find(params[:id])
    render json: { pdv: @pdv, successful: true }
  end

  def search
    @pdv = Pdv.search_by_coordinates(params[:lng], params[:lat])
    render json: { pdv: @pdv, successful: true }
  end

  private

  def pdv_params
    params.require(:pdv).permit!
  end
end
