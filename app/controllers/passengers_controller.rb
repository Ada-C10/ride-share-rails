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
    @passenger = Passenger.new(passenger_params
    )

    if @passenger.save
      redirect_to passengers_path # go to the index so we can see the book in the list
    else # save failed :(
      render :new # show the new book form view again
    end
  end

  def edit
    @passenger = Passenger.find_by(id: params[:id])
  end

  def update
    passenger = Passenger.find(params[:id])
    passenger.update(passenger_params)
    redirect_to passenger_path
  end

  def destroy
    passenger = Passenger.find_by(id: params[:id])
    passenger.destroy
    redirect_to passengers_path
  end

  private

  def passenger_params
    # only take in these params. Lesson attacks on site
    return params.require(:passenger).permit(
      :name,
      :phone_num
    )
  end
end
