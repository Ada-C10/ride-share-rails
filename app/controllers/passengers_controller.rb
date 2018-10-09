class PassengersController < ApplicationController

  # QUESTION: add a check_valid_id method to dry up code??

  def index
    # @passenger = Passenger.all.order(:due_date)
      @passengers = Passenger.all
  end

  def show
    if @passenger = Passenger.find_by(id: params[:id].to_i)
    else
      return head :not_found
    end
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)

    result = @passenger.save

    if result
      redirect_to passengers_path
    else
      render :new
    end
  end

  def edit
    @passenger = Passenger.find_by(id: params[:id])
    if !@passenger
      return head :not_found
    end
  end

  def update
    @passenger = Passenger.find(params[:id])

    result = @passenger.update(passenger_params)

    if result
      redirect_to passenger_path(@passenger)
    else
      render :edit
    end
  end

  def destroy

    @passenger = Passenger.find_by(id: params[:id])

    if @passenger
      @passenger.destroy
      redirect_to passengers_path
    else
      return head :not_found
    end
  end


  private

  def passenger_params
    return params.require(:passenger).permit(
      :name,
      :phone_num,
    )
  end
end
