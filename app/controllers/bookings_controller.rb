class BookingsController < ApplicationController
  def index
    # Get current_user room => to do add devise
    @manager = Manager.find(params[:manager_id])
    @rooms = @manager.rooms
    @selected_date = params[:selected_date]||Date.today
    @booking = Booking.new
  end

  def create
    booking = Booking.new()
    booking.client = Client.find(booking_params[:client_id])
    booking.room = Room.find(booking_params[:room_id])
    booking.start_time = build_start_time
    booking.end_time = build_end_time
    booking.save
    redirect_to manager_bookings_path(params[:manager_id], selected_date: build_start_time.to_date)
  end

  private

  def booking_params
    params.require(:booking).permit("start_time(1i)",
                                    "start_time(2i)",
                                    "start_time(3i)",
                                    "start_time(4i)",
                                    "start_time(5i)",
                                    "end_time(1i)",
                                    "end_time(2i)",
                                    "end_time(3i)",
                                    "end_time(4i)",
                                    "end_time(5i)",
                                    "client_id",
                                    "room_id"
                                    )

  end

  # à refactoriser et déplacer
  def build_start_time
    DateTime.new(booking_params["start_time(1i)"].to_i,
                booking_params["start_time(2i)"].to_i,
                booking_params["start_time(3i)"].to_i,
                booking_params["start_time(4i)"].to_i,
                booking_params["start_time(5i)"].to_i
    )
  end

  # A refactoriser et déplacer
  def build_end_time
    DateTime.new(booking_params["end_time(1i)"].to_i,
                booking_params["end_time(2i)"].to_i,
                booking_params["end_time(3i)"].to_i,
                booking_params["end_time(4i)"].to_i,
                booking_params["end_time(5i)"].to_i
    )
  end
end
