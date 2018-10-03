class DriversController < ApplicationController

  def index
    @drivers = Driver.all
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
    @driver = Driver.new(driver_params)

    is_successful = @driver.save

    if is_successful
      redirect_to drivers_path
    else
      render :new , status: :bad_request
    end

  end

  def edit
    @driver = Driver.find_by(id: params[:id])
  end

  def update
    @driver = Driver.find_by(id: params[:id])

    is_successful = @driver.update(driver_params)

      if is_successful
        redirect_to driver_path
      else
        render :edit , status: :bad_request
      end
  end

  # can't delete, as "ERROR:  update or delete on table "drivers" violates foreign key constraint "fk_rails_e7560abc33" on table "trips"
  #DETAIL:  Key (id)=(2) is still referenced from table "trips"."

#According to Dee, can modify trips within the Driver ID.  Changed driver 9 name and vin to "Driver has left the system.  Change driver of all of the trips driven by the deleted driver to driver 9?"

  def destroy
    driver = Driver.find_by(id: params[:id])
    driver.destroy

    redirect_to drivers_path
  end

  private

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end

end
