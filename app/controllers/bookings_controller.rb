class BookingsController < ApplicationController
  def create
    @experience = Experience.find(params[:experience_id])
    @booking = Booking.new(booking_params)
    @booking.price = @experience.price
    if @booking.save
      redirect_to @
  end

  private

  def booking_params
    params.require(:booking).permit(:start_on, :end_on)
  end
end
