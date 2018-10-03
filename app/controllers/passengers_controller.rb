class PassengersController < ApplicationController

  def index
    @passengers = Passenger.all
  end

  def edit
    @passenger = Passenger.find_by(id: params[:id])
  end

  def new
    @passenger = Passenger.new
  end

  def destroy
    passenger = Passenger.find_by(id: params[:id])
    passenger.destroy
    redirect_to root_path
  end

  def create
    filtered_params = passenger_params()
    @passenger = Passenger.new(filtered_params)
    save_success = @passenger.save
    if save_success
      redirect_to passengers_path
    else
      render :new
    end
  end

  def show
    passenger_id = params[:id]
    @passenger= Passenger.find_by(id: passenger_id)
    if @passenger.nil?
      head :not_found
    end
  end

  def update
    @passenger = Passenger.find(params[:id])
    @passenger.update(passenger_params)
    redirect_to passengers_path
  end

  private

  def passenger_params
    return params.require(:passenger).permit(
      :name,
      :phone_num,
    )
  end










end
