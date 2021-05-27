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

  def accept
    @booking = Booking.find(params[:id])
    @booking.accepted = true
    if @booking.save
      redirect_to dashboard_path, notice: "Booking accepted!"
    else
      render :dashboard
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      redirect_to dashboard_path, notice: "Booking declined."
    else
      render :dashboard
    end
  end
end
