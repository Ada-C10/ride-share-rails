class PassengersController < ApplicationController

  def index
    @passengers = Passenger.all.paginate(:page => params[:page]).order('id ASC')
  end

  def show
    @passenger = Passenger.find_by(id: params[:id])
    if @passenger
      @trips = @passenger.trips.all
    else
      redirect_to passengers_path, alert: "There are no passengers with that ID"
    end
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)
    if @passenger.save
      redirect_to passengers_path
    else
      render :new
    end
  end

  def edit
    @passenger = Passenger.find_by(id: params[:id])
  end

  def update
    @passenger = Passenger.find_by(id: params[:id])
    if @passenger.update(passenger_params)
      redirect_to passenger_path(@passenger.id)
    else
      render :edit
    end
  end

  def destroy
    @passenger = Passenger.find_by(id: params[:id])
    @passenger.trips.delete_all

    if @passenger
      @passenger.destroy
    end
    
    redirect_back fallback_location: :passengers_path
  end

  private

  def passenger_params
    params.require(:passenger).permit(:name, :phone_num)
  end
end
