class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    @driver= Driver.find(params[:id])
    if @driver.nil?
      head :not_found
    end
  end



end
