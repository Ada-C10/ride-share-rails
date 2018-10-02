class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @trip.destroy
    redirect_to trips_path
  end

  def index
    @trips = Trip.all
  end

  def show
  end


  private

  def set_trip
    @trip = Trip.find(params[:id])
  end


end
