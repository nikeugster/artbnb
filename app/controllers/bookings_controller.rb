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
    if @booking.save
      redirect_to art_path(@art)
    else
      render :new
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.accepted = true
    redirect_to dashboard_path, notice: "Booking accepted!"
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
