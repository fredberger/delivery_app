class PdvsController < ApplicationController
  def create
    @pdv = Pdv.new(pdv_params)
    @pdv.save
    render json: { pdv: @pdv, success: true }
  end

  def show
    @pdv = Pdv.find(params[:id])
    render json: { pdv: @pdv, success: true }
  end

  private

  def pdv_params
    params.require(:pdv).permit!
    # params.require(:pdv).permit(:tradingName, :ownerName, :document,
    #   coverageArea: [:type, coordinates: []],
    #   address: [:type, coordinates: []]
    # )
  end

  # def opre(naaasss)
  #   naaasss.map do |value|
  #     if value.is_a?(Array)
  #       [permit_recursive_params(value.first)]
  #       { key => permit_recursive_params(value) }
  #     else
  #       key
  #     end
  #   end
  # end
end
