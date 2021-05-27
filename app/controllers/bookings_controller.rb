class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @art = Art.find(params[:art_id])
  end

  def create
    @booking = Booking.new
    @art = Art.find(params[:art_id])
    @booking.user_id = current_user.id
    @booking.art = @art
    booking_dates = params[:booking]
    @booking.start_date = booking_dates["start_date"]
    @booking.end_date = booking_dates["end_date"]
    if @booking.save
      redirect_to dashboard_path, notice: "You've successfully made a booking inquiry for '#{@art.title}' by #{@art.artist}. Hopefully it will soon dress your walls. Our fingers are crossed!"
    else
      render :new
    end
  end
end
