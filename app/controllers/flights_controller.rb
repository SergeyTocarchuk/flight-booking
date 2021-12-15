class FlightsController < ApplicationController
  def index
    @flight = params[:flight] ? Flight.new(flight_params) : Flight.new    
    if flight_params
      @flights = Flight.where(flight_params).order(:date)
    end
  end

  private

  def flight_params
    params.require(:flight).permit(:origin_id, :destination_id, :date)
  end

end
