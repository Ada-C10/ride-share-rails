require 'time'

class PassengersController < ApplicationController

  def index
    @passengers = Passenger.all  #..order(:title)
  end

  def show
    id = params[:id].to_i
    @passenger = Passenger.find_by(id: id)

    if @passenger.nil?
      render :notfound, status: :not_found
    end
  end

end
