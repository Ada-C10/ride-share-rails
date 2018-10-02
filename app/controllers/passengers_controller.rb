class PassengersController < ApplicationController

  def index
    @passengers = Passengers.all
  end









end
