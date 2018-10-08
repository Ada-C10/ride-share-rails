class PassengersController < ApplicationController
  def index
    if params[:search]
      @passengers = Passenger.search(params[:search]).paginate(page: params[:page], per_page: 10)
    else
      @passengers = Passenger.all.paginate(page: params[:page], per_page: 10)
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
    @passenger = Passenger.new(passenger_params)

    if @passenger.save
      redirect_to passenger_path(@passenger)
    else
      render :new, status: :bad_request
    end
  end

  def edit
    @passenger = Passenger.find_by(id: params[:id])
  end

  def update
    passenger = Passenger.find(params[:id])

    if passenger.update(passenger_params)
      redirect_to passenger_path(passenger.id)
    else
      render :edit, status: :bad_request
    end
  end

  def destroy
    passenger = Passenger.find_by(id: params[:id])

    if passenger.destroy
      redirect_to passengers_path
    else
      render :index, status: :bad_request
    end
  end



  private

  def passenger_params
    return params.require(:passenger).permit(
      :name,
      :phone_num
    )
  end

end
