class PassengersController < ApplicationController
  def show
    @passenger = Passenger.find_by(id:params[:id])
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

  def index
    @passengers= Passenger.all
  end

  def edit
    @passenger = Passenger.find_by(id: params[:id].to_i)
  end

  def update
    @passenger = Passenger.find_by(id:params[:id])
    @passenger.update(passenger_params)
    if @passenger.save
      redirect_to passenger_path
    else
      render :new
    end
  end

  private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end

end
