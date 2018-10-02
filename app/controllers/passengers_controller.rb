class PassengersController < ApplicationController
  def show
    @passenger = Passenger.find_by(id:params[:id])
  end

  def new
  end

  def index
    @passengers= Passenger.all
  end

  def edit
  end
end
