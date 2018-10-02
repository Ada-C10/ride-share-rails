class PassengersController < ApplicationController

  def index
    @passengers = Passenger.all
  end

  def show
    passenger_id = params[:id]
    @passenger = Passenger.all.find_by(id: passenger_id)

    if @passenger.nil?
      head :not_found
    end
  end

end
