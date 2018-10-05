class PassengersController < ApplicationController
  def index
    @passengers = Passenger.order("name").page(params[:page]).per_page(7)
  end

  def show
    passenger_id = params[:id]
    @passenger = Passenger.find_by(id: passenger_id)
    if @passenger == nil
      render 'layouts/not_found_page', status: :not_found
    end
    @passenger_trips = @passenger.trips.order("date").page(params[:page]).per_page(4)

  end

  def new
    @passenger = Passenger.new
  end

  def create
    filtered_passenger_params = passenger_params()
    @passenger = Passenger.new(filtered_passenger_params)

    is_successful_save = @passenger.save

    if is_successful_save
      redirect_to passengers_path
    else
      render :new
    end
  end
  #
  def edit
    @passenger = Passenger.find_by(id: params[:id])
  end

  def update
    passenger = Passenger.find(params[:id])
    passenger.update(passenger_params)

    redirect_to passenger_path(passenger.id)
  end

  def destroy
    passenger = Passenger.find_by(id: params[:id])

    passenger.destroy
    redirect_to passengers_path
  end

  private
  #
  # # Strong params: only let certain attributes
  # # through
  def passenger_params
    return params.require(:passenger).permit(
      :name,
      :phone_num,
    )
  end
end
