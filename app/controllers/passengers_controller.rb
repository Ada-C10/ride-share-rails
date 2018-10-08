class PassengersController < ApplicationController
  def index
    trip = Trip.find_by(id: params[:trip_id])
    @passengers = Passenger.all.order(:name)
  end

  def show
    id = params[:id].to_i
    @passenger = Passenger.find_by(id: id)
    @trips = @passenger.trips.all
    if @passenger.nil?
      render :notfound, status: :not_found
    end
  end

  def edit
    @passenger = Passenger.find(params[:id].to_i)
  end

  def create
    @passenger = Passenger.new(passenger_params)
    if @passenger.save
      redirect_to passengers_path
    else
      render :new
    end
  end

  def new
    @passenger = Passenger.new
  end

  def destroy
    passenger = Passenger.find_by(id: params[:id].to_i)
    # passenger.destroy
    passenger.status = "inactive"
    redirect_to passengers_path
  end

  def update
    passenger = Passenger.find_by(id: params[:id].to_i)
    passenger.update(passenger_params)
    redirect_to passenger_path(passenger.id)
  end

private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end

end
