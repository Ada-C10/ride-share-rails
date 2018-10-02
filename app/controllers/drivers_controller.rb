class DriversController < ApplicationController

  def index
    @drivers = Driver.all
  end

  def edit
  end

  def new
  end

  def destroy
  end

  def create
  end

  def show
  end

  def update
  end

  private

  def book_params
    return params.require(:driver).permit(
      :name,
      :vin
    )
  end

end
