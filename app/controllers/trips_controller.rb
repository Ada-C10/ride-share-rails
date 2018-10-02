class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end


  private

  def set_trip
    @trip = Trip.find(params[:id])
  end


end
