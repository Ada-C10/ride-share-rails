class TripsController < ApplicationController
  def show
    @trip = Trip.find_by(id: params[:id])
    @passenger = Passenger.find_by(id: @trip.passenger_id)
    @driver = Driver.find_by(id: @trip.driver_id)

    if @trip.nil?
      render :notfound, status: :not_found
    end
  end

  def edit
    @trip = Trip.find_by(id: params[:id])

    if @trip.nil?
      render :notfound, status: :not_found
    end
  end

  def update
    trip = Trip.find_by(id: params[:id])
    trip.update(trip_params)

    if trip.save
      redirect_to trip_path
    else
      render :edit
    end
  end

  def destroy
    trip = Trip.find_by(id: params[:id])
    trip.destroy

    redirect_to
  end

  # to create a link to it on passenger page
  def create
    # passenger = Passenger.find_by(id: params[:id])
    # driver = Driver.all.where(status: true).first
    # trip = Trip.new(date: Date.current, driver: driver.id, passenger: passenger.id)
    # if trip.save
    #   driver.status = false
    #   driver.save
    #   redirect_to passenger_path
    # else
    #   something
    # end
  end

  private
  def trip_params
    return params.required(:trip).permit(:driver_id, :passenger_id, :date, :rating, :cost)
  end
end
