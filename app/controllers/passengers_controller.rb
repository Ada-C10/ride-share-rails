class PassengersController < ApplicationController
  def index
    @passengers = Passenger.where(is_active: true).search(params[:term], params[:page])
  end

  def show
    @passenger = Passenger.find_by(id: params[:id].to_i)

    if @passenger.nil? || !@passenger.is_active
      render :notfound, status: :not_found
    end
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)
    @passenger.is_active = true

    if @passenger.save
      redirect_to passenger_path(@passenger.id)
    else
      render :new
    end
  end

  def edit
    @passenger = Passenger.find_by(id: params[:id].to_i)

    if @passenger.nil? || !@passenger.is_active
      render :notfound, status: :not_found
    end
  end

  def update
    @passenger = Passenger.find_by(id: params[:id].to_i)

    if @passenger.update(passenger_params)
      redirect_to passenger_path(@passenger.id)
    else
      render :edit
    end
  end

  def destroy
    @deleted_passenger = Passenger.find_by(id: params[:id].to_i)
    @deleted_passenger.update(is_active: false)
  end

  private

    def passenger_params
      return params.require(:passenger).permit(:id, :name, :phone_num, :image_url)
    end
end
