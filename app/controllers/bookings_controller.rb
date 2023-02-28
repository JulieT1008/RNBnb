class BookingsController < ApplicationController
  before_action :set_bookings, only: [:show]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @artist = Artist.find(params[:artist_id])
    @booking.artist = @artist
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_bookings
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date, :artist_id)
  end
end
