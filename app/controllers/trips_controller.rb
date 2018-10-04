class TripsController < ApplicationController
  def index

  end


  def show

    @trip = Trip.find_by(id: params[:id])
    if @trip.nil?
      head :not_found
    end

  end

  # def new
  #   if params[:passenger_id]
  #     passenger = Passenger.find_by(id: params[:passenger_id])
  #     @trip = passenger.trips.new
  #   end
  # end


  def create

    if params[:passenger_id]
      passenger = Passenger.find_by(id: params[:passenger_id])

      @trip = passenger.trips.new(date: Date.today, driver: Driver.all.sample)

      if @trip.save
        redirect_to passenger_path(passenger.id)
      else
        #TODO validation
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
