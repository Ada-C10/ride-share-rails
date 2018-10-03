class DriversController < ApplicationController

  def index
    @drivers = Driver.all
  end

  def show
    @drivers = Driver.find_by(id: params[:id])

    if @drivers.nil?
      head :not_found
    end
  end

  def new
    @driver = Driver.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  # this is for params


end
