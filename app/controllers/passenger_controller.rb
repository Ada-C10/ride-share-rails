class PassengerController < ApplicationController
  def index
    @passenger = Passenger.all.order
  end

  def show
    id = params[:id].to_i
    @passenger = Passenger.find_by(id: id)
  end
end
