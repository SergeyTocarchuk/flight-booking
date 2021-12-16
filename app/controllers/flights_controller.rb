class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @flights = @flights.where(origin_id: params[:origin_id]) if params[:origin_id].present?
    @flights = @flights.where(destination_id: params[:destination_id]) if params[:destination_id].present?
    @flights = @flights.where(destination_id: params[:destination_id]) if params[:destination_id].present?
    @flights = @flights.order(:date)
  end

  private

  def flight_params
    params.require(:flight).permit(:origin_id, :destination_id, :date)
  end

end