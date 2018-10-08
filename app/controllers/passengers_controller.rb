class PassengersController < ApplicationController

 def index
    @passengers = Passenger.all
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)

    if @passenger.save
      redirect_to passengers_path
    else
      render :new, status: :bad_request
    end
    
  end

  def edit
    @passenger = Passenger.find_by(id: params[:id])
    if @passenger.nil?
      head :not_found
    end
  end

  def update
    @passenger = Passenger.find(params[:id])

    if @passenger.nil?
      head :not_found
    end

    is_updated = @passenger.update(passenger_params)

    if is_updated
      redirect_to passenger_trips_path(@passenger)
    else
      render :edit, status: :bad_request
    end
  end

  def destroy
    passenger = Passenger.find_by(id: params[:id])

    if passenger.nil?
      head :not_found
    end

    if passenger.destroy
      redirect_to passengers_path
    else
      render :show
    end
  end

  private

  def passenger_params
    return params.require(:passenger).permit(
      :name,
      :phone_num
    )
  end
end
