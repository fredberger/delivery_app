class PdvsController < ApplicationController
  def create
    @pdv = Pdv.new(pdv_params)
    @pdv.save
    render json: { pdv: @pdv, success: true }
  end

  private

  def pdv_params
    params.require(:pdv).permit!
  end

end
