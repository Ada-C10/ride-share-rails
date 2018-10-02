class DriversController < ApplicationController

  def index
    @drivers = Driver.all.order(:name)
  end

  def show
    id = params[:id]
    @driver = Driver.find_by(id: id)


    if id == nil
      render :not_found,
      # status: :not_found
    end
  end

  def new
    @driver = Driver.new
  end


  def edit
    id = params[:id].to_i
    @driver = Driver.find_by(id: id)
  end

  def update
    id = params[:id].to_i
    @driver = Driver.find_by(id: id)
    @driver.update(driver_params)
    # @task.name = params[:task][:name]
    # @task.description = params[:task][:description]
    # @task.due = params[:task][:due]
    if @driver.save
      redirect_to drivers_root # go to the index so we can see the book in the list
    else
      render :new
    end
  end

  def create
    @driver = Driver.new(driver_params)
    # @task = Task.new(name: params[:task][:name], description: params[:task][:description], due: params[:task][:due]) #instantiate a new book
    if @driver.save # save returns true if the database insert succeeds
      redirect_to drivers_root # go to the index so we can see the book in the list
    else # save failed :(
      render :new # show the new book form view again
    end
  end

  def destroy
    id = params[:id].to_i
    @driver = Driver.find_by(id: id)
    if @driver.destroy
      redirect_to drivers_root
    end
  end

  # def status
  #   id = params[:id].to_i
  #   @task = Task.find_by(id: id)
  #   if @task.due.class == String
  #     @task.due = nil
  #   else @task.due == nil
  #     @task.due = "Completed on #{Date.today}"
  #   end
  #   @task.save
  #   redirect_to root_path
  # end

  private

    def driver_params
      return params.require(:driver).permit(:name, :vin)
    end
end
