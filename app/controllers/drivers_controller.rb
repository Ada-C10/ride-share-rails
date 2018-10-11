class DriversController < ApplicationController
  before_action :get_driver, only: [:show, :edit, :update, :destroy, :status]

  def index
    @drivers = Driver.search(params[:term], params[:page])
  end

  def show
    @trips = @driver.trips
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)

    if @driver.save
      redirect_to drivers_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @driver.update(driver_params)
      redirect_to driver_path
    else
      render :edit
    end
  end

  def destroy
    if !@driver.nil?
      @driver.active = false
      @driver.status = false
      if @driver.save
          redirect_to drivers_path
      end
    end
  end

  def status
    if @driver.status == true
      @driver.update(status: false)
    else
      @driver.update(status: true)
    end

    redirect_to driver_path(@driver.id)
  end


  private
  def driver_params
    return params.required(:driver).permit(:name, :vin)
  end

  def get_driver
    @driver = Driver.find_by(id: params[:id].to_i)

    if @driver.nil?
      render :notfound, status: :not_found
    end
  end

end
