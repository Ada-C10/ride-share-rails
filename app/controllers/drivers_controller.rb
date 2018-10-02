class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    id = params[:id].to_i
    @driver = Driver.find_by(id: id)


    if @driver.nil?
     render :notfound, status: :not_found
    end
  end

  def edit
  end

  def new
  end
end
