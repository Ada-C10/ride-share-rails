class TripsController < ApplicationController
  def index

  end


  def show

    @trip = Trip.find_by(id: params[:id])
    if @trip.nil?
      head :not_found
    end

  end


  def create

    if params[:passenger_id]
      passenger = Passenger.find_by(id: params[:passenger_id])
      @trip = Trip.new
      #
      @trip = passenger.trips.new(date: Date.today, driver: @trip.assign_driver)

      if @trip.save
        redirect_to passenger_path(passenger.id)
      else
        #TODO validation
        render :bad_request
      end
    end
  end

  def update
      if params[:passenger_id]
        passenger = Passenger.find_by(id: params[:passenger_id])

        trip = passenger.trips.find_by(:id)

        trip.update(trip_params())

        if trip.save
          redirect_to passenger_path(passenger.id)
        else
          render :bad_request
        end
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
