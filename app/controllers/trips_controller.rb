class TripsController < ApplicationController
  before_action :get_trip, only: [:edit, :update, :destroy]
  def get_trip
    @trip = Trip.find(params[:id].to_i)
  end




  def show
    @trip = Trip.find_by(id: params[:id])

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

    redirect_back(fallback_location: root_path)
    # why is it trying to run the show method and view
  end


  def create
    if params[:passenger_id]
      @passenger_id = params[:passenger_id].to_i
      driver = Driver.new_trip_driver
      @trip = Trip.new(driver_id: driver, passenger_id: @passenger_id, date: DateTime.now)
      if @trip.save
        redirect_to trips_path
      else
        # render :new
      end
    end
  end

    
  end

  # private
  # def trip_params
  #   return params.require(:trip).permit(:driver_id, :passenger_id)
  #  end
