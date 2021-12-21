class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @passenger = @booking.build_passenger
    @flight = Flight.find(params[:flight_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @passenger = @booking.create_passenger(name: params[:booking][:passengers][:name],
                                          email: params[:booking][:passengers][:email]
                                          )
    if @booking.save
      PassengerMailer.with(booking_id: @booking.id).confirmation.deliver_now
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
  end
  
end
