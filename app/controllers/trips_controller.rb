class TripsController < ApplicationController
  def index

  end


  def show

    @trip = Trip.find_by(id: params[:id])
    if @trip.nil?
      head :not_found
    end

  end

  def new
    @trip = Trip.new
  end


  def create

    passenger = Passenger.find_by(id: params[:passenger_id])
    
    @trip = passenger.trips.new

    if @trip.save
      redirect_to passenger_path(passenger)
    else
      #TODO validation
      render :new
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
