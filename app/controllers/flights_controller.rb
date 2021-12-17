class FlightsController < ApplicationController
  def index
    if params[:is_searching]
      @flights = Flight.all
      @flights = @flights.where(origin_id: params[:origin_id]) if params[:origin_id].present?
      @flights = @flights.where(destination_id: params[:destination_id]) if params[:destination_id].present?
      @flights = @flights.where(destination_id: params[:destination_id]) if params[:destination_id].present?
      @flights = @flights.order(:date)
    else
      @flights = []
    end
  end

  private

  def flight_params
    params.require(:flight).permit(:origin_id, :destination_id, :date)
  end

end