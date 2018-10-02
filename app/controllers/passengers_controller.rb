class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all.order(:name)
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

  def create
    ###### TODO Add error message for if it does not save  #####
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
    passenger.destroy
    redirect_to passengers_path
  end

  def update
    passenger = Passenger.find_by(id: params[:id].to_i)
    passenger.update(passenger_params)
    ###### TODO Add error message for if it does not save  #####
    redirect_to passenger_path(passenger.id)
  end

private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end

end
