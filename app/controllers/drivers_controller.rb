class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
  end

  def edit
  end

  def new
  end
end
