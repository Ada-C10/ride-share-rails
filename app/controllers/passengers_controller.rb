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

end
