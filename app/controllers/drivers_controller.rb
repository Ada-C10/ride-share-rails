class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    @driver = Driver.find_by( id: params[:id])
    if @driver.nil?
      head :not_found
    end
  end

  def new
    @driver = Driver.new
  end

  def create
    filtered_driver_params = driver_params()
    @driver = Driver.new(filtered_driver_params)

    is_successful_save = @driver.save

    if is_successful_save
      redirect_to drivers_path
    else
      render :new, status: :bad_request
    end
  end




  def edit
    @driver = Driver.find_by(id: params[:id])
  end

  #edit from here on
  def update
    driver = Driver.find(params[:id])
    if driver.update(driver_params)
      redirect_to drivers_path(driver.id)
    else
      render :edit, status: :bad_request
    end
  end

  def destroy
    driver = Driver.find_by(id: params[:id])

    if driver.trips.length == 0
      driver.destroy
      redirect_to drivers_path

    else
      #need to tell the client why they can't delete passenger as they are associated with other trips

      render :error, status: :bad_request
    end


  end


  private

  # Strong params: only let certain attributes
  # through
  def driver_params
    return params.require(:driver).permit(
      :name,
      :vin
    )
  end

end
