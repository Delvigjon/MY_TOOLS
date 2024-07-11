class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  # def new
  #   @booking = Booking.new
  # end

  def edit
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.tool = Tool.find(params[:tool_id])
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path, notice: 'Location créée avec succès.'
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Location mise à jour avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: 'Location supprimée avec succès.'
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :tool_id, :user_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
