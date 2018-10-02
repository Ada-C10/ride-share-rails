require 'time'

class PassengersController < ApplicationController

  def index
    @passengers = Passenger.all  #..order(:title)
  end

  def show
    id = params[:id].to_i
    @passenger = Passenger.find_by(id: id)

    if @passenger.nil?
      render :notfound, status: :not_found
    end
  end

  def edit
    @passenger = Passenger.find(params[:id].to_i)
  end

  def update
    passenger = Passenger.find_by(id: params[:id].to_i)
    passenger.update(passenger_params)

    redirect_to passenger_path(passenger.id)
  end

  def new
    @passengers = Passenger.new
  end

  def create
    @passengers = Passenger.new(passenger_params)

    if @passengers.save
      redirect_to passenger_path
    else
      render :new
    end
  end

  def destroy
    passenger = Passenger.find_by(id: params[:id].to_i)
    passenger.destroy
    render :index
  end

private

def passenger_params
  return params.require(:passenger).permit(:name, :phone_num)
end


end
