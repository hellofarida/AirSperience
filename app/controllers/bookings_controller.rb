class BookingsController < ApplicationController
  def create
    @experience = Experience.find(params[:experience_id])
    @booking = Booking.new(booking_params)
    @booking.experience = @experience
    @booking.renter = current_user
    @booking.booking_price

    if @booking.save
      redirect_to dashboard_path
    else
      render 'experiences/show'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_on, :end_on)
  end
end
