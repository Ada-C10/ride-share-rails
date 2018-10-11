class PassengersController < ApplicationController
  before_action :get_passenger, only: [:show, :edit, :update, :destroy]

  def index
    @passengers = Passenger.search(params[:term], params[:page])
  end

  def show
    @trips = @passenger.trips
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

  def edit; end

  def update
    if @passenger.update(passenger_params)
      redirect_to passenger_path
    else
      render :edit
    end
  end

  def destroy
    if !@passenger.nil?
      @passenger.active = false
      if @passenger.save
        redirect_to passengers_path
      end
    end
  end

  private
  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end

  def get_passenger
    @passenger = Passenger.find_by(id: params[:id].to_i)

    if @passenger.nil?
      render :notfound, status: :not_found
    end
  end
end
