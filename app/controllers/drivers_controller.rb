class DriversController < ApplicationController
  def index
    @drivers = (Driver.all).sort_by do |driver|
      driver.id
    end
  end

  def show
    @driver = Driver.find_by(id: params[:id])
    if @driver.nil?
      head :not_found
    end
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(name: params[:driver][:name],
                    vin: params[:driver][:vin])
    if @driver.save
      flash[:notice] = "Driver created successfully!"
      redirect_to all_drivers_path
    else
      render :new
    end
  end

  def edit
    @driver= Driver.find_by(id: params[:id])
  end

  def update
    @driver = Driver.find_by(id: params[:id])

    if @driver.update(driver_params)
      redirect_to all_drivers_path(@driver.id)
    else
      render :update
    end
  end

  def destroy
    driver = Driver.find_by(id: params[:id])

    driver.destroy
    redirect_to all_drivers_path
  end

  private

  # Strong params: only let certain attributes
  # through
  def driver_params
    return params.require(:driver).permit(
      :name,
      :vin,
    )
  end

end
