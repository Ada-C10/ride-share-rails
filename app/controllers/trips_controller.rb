class TripsController < ApplicationController
  def index

  end


  def show

    @trip = Trip.find_by(id: params[:id])
    if @trip.nil?
      head :not_found
    end
  end


  def rating_completed?
    @trips = Trip.where(id: params[:passenger_id])

    @trips.each do |trip|
      if trip.rating == nil
        return false
      end
    end
    return true
  end


  def create
    if rating_completed?
      if params[:passenger_id]
        passenger = Passenger.find_by(id: params[:passenger_id])

        driver = Driver.available_driver
        @trip = passenger.trips.new(date: Date.today, driver: driver , cost: rand(1000..9999))

        if @trip.save && driver.change_status
          redirect_to passenger_path(passenger.id)
        else
          render :bad_request
        end
      end
    else
      render :bad_request
    end
  end



  def update

    trip = Trip.find_by(id: params[:id])

    trip.update(trip_params)

    passenger = trip.passenger

    if trip.save
      redirect_to passenger_path(passenger.id)
    else
      render :bad_request
    end
  end


  private
  def trip_params
    return params.require(:trip).permit(
      :date,
      :driver_id,
      :passenger_id,
      :price,
      :rating,
    )
  end
end
