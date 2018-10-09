class PassengersController < ApplicationController
  def index
    @passengers = (Passenger.all).sort_by do |passenger|
      passenger.id
    end
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
    @passenger = Passenger.new(name: params[:passenger][:name], phone_num: params[:passenger][:phone_num]) #instantiate a new passenger

    if @passenger.save # save returns true if the database insert succeeds
      redirect_to passengers_path # go to the index so we can see the passenger in the list
    else # save failed :(
      render :new
    end

  end

  def edit
    @passenger = Passenger.find_by(id: params[:id])
  end

  def update
    passenger = Passenger.find_by(id: params[:id])
    passenger.update(passenger_params)

    is_successful = passenger.save

    if is_successful # save returns true if the database insert succeeds
      redirect_to passengers_path(passenger.id) # go to the index so we can see the book in the list
    else # save failed :(
      render :new # show the new book form view again
    end

  end

  def destroy
    passenger = Passenger.find_by(id: params[:id])

    passenger.destroy

    redirect_to passengers_path(passenger.id)
  end

  private

  def passenger_params
    return params.require(:passenger).permit(
      :name,
      :phone_num,
    )
  end

end
