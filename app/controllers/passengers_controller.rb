class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def show
    @passenger = Passenger.find(params[:id])
    if @passenger.nil?
      head :not_found
    end
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
      render :new, status: :bad_request
    end
  end

  def edit
    @passenger = Passenger.find_by(id: params[:id])
  end


#question about path, edit from here
  def update
    passenger = Passenger.find(params[:id])
    if passenger.update(passenger_params)
      # redirect_to trips_path(passenger.id)
    else
      render :edit, status: :bad_request
    end
  end

def destroy
  passenger = Passenger.find_by(id: params[:id])

  passenger.destroy
  redirect_to trips_path
end


  private

  # Strong params: only let certain attributes
  # through
  def passenger_params
    return params.require(:passenger).permit(
      :name,
      :phone_num
    )
  end


end
