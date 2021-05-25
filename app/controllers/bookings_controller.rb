class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @art = Art.find(params[:art_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @art = Art.find(params[:art_id])
    @booking.art = @art
    if @booking.save
      redirect_to art_path(@art)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:art_id)
  end
end
