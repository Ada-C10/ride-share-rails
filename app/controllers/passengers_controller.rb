class PassengersController < ApplicationController

  def index
    @passengers = Passenger.all.order(:name)
  end

  def new
    @passenger = Passenger.new
  end

  def edit
    @passenger = Passenger.find(params[:id].to_i)
  end

  def destroy
    passenger = Passenger.find_by(id: params[:id].to_i)
    passenger.destroy

    redirect_to passengers_path
  end

  def create
    @passenger = Passenger.new(passenger_params)
    if @passenger.save
      redirect_to passenger_trips_path(@passenger.id) #does this need to be to integer?
    else
      render :new
    end
  end

  def update
    @passenger = Passenger.find_by(id: params[:id].to_i)
    @passenger.update!(passenger_params)

    redirect_to passenger_trips_path(@passenger.id)
  end

  private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end

end
