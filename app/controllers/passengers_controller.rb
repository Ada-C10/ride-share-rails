class PassengersController < ApplicationController
  before_action :get_passenger, only: [:show, :edit]
  def get_passenger
    @passenger = Passenger.find(params[:id].to_i)
  end

  def index
    @passengers = Passenger.all.order(:name)
  end

  def show
    @trips = @passenger.trips

    if @passenger.nil?
      render :notfound, status: :not_found
    end
  end

  def new
    @passenger = Passenger.new
  end

  def create
    passenger = Passenger.new(passenger_params)

    if passenger.save
      redirect_to passengers_path
    else
      render :new
    end
  end

  def edit
    if @passenger.nil?
      render :notfound, status: :not_found
    end
  end

  def update
    passenger = Passenger.find(params[:id].to_i)

    if passenger.update(passenger_params)
      redirect_to passenger_path
    else
      render :edit
    end
  end

  def destroy
    passenger = Passenger.find(params[:id].to_i)
    passenger.active = false

    if passenger.save
      redirect_to passengers_path
    end
  end

  private
  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end
end
