class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all.order(:name)
  end

  def show
    @passenger = Passenger.find_by(id: params[:id])
    if @passenger.nil?
      head :not_found
    end
    @total = @passenger.total_spending
  end

  def new
    @passenger = Passenger.new

  end

  def create

    @passenger = Passenger.new(passenger_params())

    if @passenger.save
      redirect_to passengers_path
    else
      #TODO validation
      render :new
    end
  end

  def edit

    @passenger = Passenger.find_by(id: params[:id])
  end

  def update
    passenger = Passenger.find_by(id: params[:id])

    if passenger.update(passenger_params)
      redirect_to passenger_path(passenger.id)
    end
  end

  def destroy

    @passenger = Passenger.find_by(id: params[:id])
    @passenger.destroy

    redirect_to passengers_path
  end


  private
  def passenger_params
    return params.require(:passenger).permit(
      :name,
      :phone_num
    )
  end

end
