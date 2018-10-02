class DriversController < ApplicationController
  def index
    @drivers = Driver.all.order(:name)
  end

  def show
    @driver = Driver.find_by(id: params[:id])

    if @driver.nil?
      render :notfound, status: :not_found
    end
  end

  def edit
  end

  def destroy
  end

  def update
  end

  def new
  end

  def create
  end
end
