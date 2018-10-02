class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def show
    @passenger = Passenger.find_by(id: params[:id])
    if @passenger.nil?
      head :not_found
    end
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(name: params[:passenger][:name],
                          phone_num: params[:passenger][:phone_num]) #instantiate a new passenger

      if @passenger.save # save returns true if the database insert succeeds
        redirect_to all_passengers_path # go to the index so we can see the passenger in the list
      else # save failed :(
        render :new # show the new passenger form view again
      end
    end
  end
