class TripsController < ApplicationController

  def index
    @trips = Trips.all
  end









end
