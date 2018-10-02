class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all.order(:name)
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

    @passenger = Passenger.new(passenger_params())
    @passenger.completed = false
    if @passenger.save
      redirect_to passengers_path
    else
      #TODO validation
      render :new
    end
  end

  def edit

    @passenger = Passenger.find_by(id: params[:id])
  end

  def update
    @passenger = Passenger.find_by(id: params[:id])

    if @passenger.update(passenger_params)
      redirect_to passenger_path(passenger)
  end

  def destroy

  end


end
