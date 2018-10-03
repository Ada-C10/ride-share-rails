require 'date'

class TripsController < ApplicationController
  def index
    @trips = (Trip.all).sort_by do |trip|
      trip.id
    end
  end

  def show
    @trip = Trip.find_by(id: params[:id])
    if @trip.nil?
      head :not_found
    end
  end


end
