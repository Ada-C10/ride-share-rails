class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show

  end

  def edit
  end
end
