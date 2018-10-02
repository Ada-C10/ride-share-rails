class DriversController < ApplicationController

  def index
    @drivers = Driver.all
  end

  

  private

  def driver_params
    return params.require(:driver).permit(
      :name,
      :phone_num
    )
  end


end
