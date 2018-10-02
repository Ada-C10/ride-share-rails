require 'time'

class PassengersController < ApplicationController

  def index
    @passengers = Passenger.all  #..order(:title)
  end

  def show
    @passengers = Passenger.find_by(id: params[:id].to_i)

    if @passengers.nil?
      render :notfound, status: :not_found
    end
  end

end
