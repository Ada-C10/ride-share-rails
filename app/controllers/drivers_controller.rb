class DriversController < ApplicationController
  # create routes
  def index
    @driver = Driver.all
  end

  def show
    id = params[:id].to_i
    @driver = Driver.find_by(id: id)
    if @driver.nil?
      render :notfound, status: :notfound
    end
  end

  def create
    @driver = Driver.new(driver_params)
    if @driver.save
      redirect_to drivers_path
    else
      render :new
    end
  end

  def update
    @driver = Driver.find_by(id: params[:id].to_i)
    if @driver.update(driver_params)
      redirect_to driver_path(@driver.id)
    else
      render :edit
    end
  end

  def edit
    @driver = Driver.find(params[:id].to_i)
  end

  def new
    @driver = Driver.new
  end

  def destroy
    # we should actually make them inactive instead of deleting them
    # you should delete them if they are are a bad driver:
    # options: delete it's associated trips, but then the passangers can't see their history of trips
    # better option to make drivers inactive by adding an status column

    driver = Driver.find_by(id: params[:id].to_i)
    # infom user: you tried to delete a driver who has a trip (currently driving) , you can't delete it because of foreing key currently attached to trip
    # destroy action throws an error exception, so you can't use if statement, you have to rescue that exception
    begin
      driver.destroy
    rescue
      driver.status = false
      driver.save
    end
    redirect_to drivers_path
  end

  private
  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end
end
