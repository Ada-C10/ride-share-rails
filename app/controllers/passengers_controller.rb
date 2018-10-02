class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def show
  end

  def edit
  end

  def new
  end
end
