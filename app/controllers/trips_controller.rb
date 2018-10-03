class TripsController < ApplicationController
  def index

  end


  def new

  end

<<<<<<< HEAD

  def create


  end




=======
  def create
    
  end

>>>>>>> passenger
  private
  def trip_params
    return params.require(:trip).permit(
      :date,
      :driver_id,
      :passenger_id,
      :price,
      :rating,
    )
  end
end
