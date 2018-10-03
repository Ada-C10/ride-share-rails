class PassengersController < ApplicationController
  def index
  @passengers = Passenger.all.order(:id)
end

def show
  id = params[:id].to_i
  @passenger = Passenger.find_by(id: id)

  if @passenger.nil?
   render :notfound, status: :not_found
  end
end

def new
  @passenger = Passenger.new
end

def edit
  @passenger = Passenger.find(params[:id].to_i)
end

def destroy
  passenger = Passenger.find_by(id: params[:id].to_i)

  begin
   @deleted_passenger = passenger.destroy
  rescue
    passenger.status = false
    passenger.save
  end
  redirect_to passengers_path
end


  def create
    @passenger = Passenger.new(passenger_params)
    if @passenger.save
      redirect_to passengers_path
    else
      render :new
    end
  end

  def update
    passenger = Passenger.find_by(id: params[:id].to_i)
    passenger.update(passenger_params)

    redirect_to passenger_path(passenger.id)
  end

private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end

end
