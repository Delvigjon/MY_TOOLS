class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def edit
  end

  def create
    @booking = current_user.bookings.build(booking_params)

    if @booking.save
      redirect_to @booking, notice: 'Location créée avec succès.'
    else
      render :new
    end
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Location mise à jour avec succès.'
    else
      set_tools
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: 'Location supprimée avec succès.'
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :tool_id)
  end
end
