class TripsController < ApplicationController

  def index
    @trips = Trip.all
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
    @trip = Trip.new(trip_params)

    if @trip.save
      redirect_to trips_path
    else
      render :new, status: :bad_request
    end
  end

  def edit
    @trip = Trip.find_by(id: params[:id])
  end


  def update
    @trip = Trip.find_by(id: params[:id])
    result = @trip.update(trip_params)

    if result
      redirect_to trip_path(@trip.id)
    else
      render :edit, status: :bad_request
    end
  end

  def destroy
    trip = Trip.find_by(id: params[:id])

    trip.destroy
    redirect_to trips_path
  end



  private
  def trip_params
    return params.require(:trip).permit(
      :date,
      :rating,
      :cost
    )
  end

end
