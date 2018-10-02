class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all.order(:name)
  end

  def show
    @passenger = Passenger.find_by(id: params[:id].to_i)

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
      redirect_to passenger_path(passenger.id)
    else
      render :new
    end
  end

  def edit
    @passenger = Passenger.find_by(id: params[:id].to_i)
  end

  def update
    passenger = Passenger.find_by(id: params[:id].to_i)
    passenger.update(passenger_params)

    redirect_to passenger_path(passenger.id)
  end

  def destroy
    @deleted_passenger = Passenger.find_by(id: params[:id].to_i)
    @deleted_passenger.destroy
  end

  private

    def passenger_params
      return params.require(:passenger).permit(:id, :name, :phone_num)
    end
end
