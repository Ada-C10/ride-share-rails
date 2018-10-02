class PassengersController < ApplicationController
  before_action :get_passenger, only: [:edit, :update, :destroy]
  def get_passenger
    @passenger = Passenger.find(params[:id].to_i)
  end

  
  def index
    @Passengers = Passenger.all.order(:name)
  end

  def show
    id = params[:id].to_i
    @passenger = Passenger.find_by(id: id)
    if @passenger.nil?
      render :notfound, status: :not_found
    end
  end

  def edit
  end

  def destroy
    @passenger.destroy
    redirect_to passenger_path
  end
    
  def update
    if @passenger.update(passenger_params)
      redirect_to passenger_path
    else
      render :new
    end
  end


  def new
    @passenger = Passenger.new
  end

  def create
    passenger = Passenger.new(passenger_params)
    if passenger.save
      redirect_to passengers_path
    else
      render :new
    end
  end

  private # only accessible within the model's controller
  def passenger_params
    # provide the elements that can be passed in as parameters
    # this makes strong params allow for DRY and secure
    return params.require(:passenger).permit(:name,
                                        :phone_num)
  end
end

