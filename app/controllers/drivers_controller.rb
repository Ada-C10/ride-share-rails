class DriversController < ApplicationController

  def index
      @drivers = Driver.all
    end

    def show
      id = params[:id]
      @driver = Driver.find_by(id:id)

    end


end
