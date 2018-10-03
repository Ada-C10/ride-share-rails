class PassengersController < ApplicationController
  def index
    # @passenger = Passenger.all.order(:due_date)
      @passengers = Passenger.all
  end

  def show
    # TODO: add 404 routing if not found; make a method?
    @passenger = Passenger.find(params[:id].to_i)
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)

    is_successful_save = @passenger.save

    if is_successful_save
      redirect_to passengers_path
    else
      render :new
    end
  end

  def edit
    # TODO: add 404 routing if not found; make a method?

    @passenger = Passenger.find_by(id: params[:id])

    if !@passenger
      return raise ActiveRecord::RecordNotFound, 'Record not found - cannot edit'
    end
  end

  def update
    # TODO: add 404 routing if not found; make a method?

    @passenger = Passenger.find(params[:id])

    @passenger.update(passenger_params)

    redirect_to passenger_path(@passenger)
  end

  def destroy
    # TODO: add 404 routing if not found; make a method?

    @passenger = Passenger.find_by(id: params[:id])

    if @passenger
      @passenger.destroy
      redirect_to passengers_path
    else
      return raise ActiveRecord::RecordNotFound, 'Record not found - cannot delete'
    end
  end
  #
  # def complete
  #   @task = Task.find(params[:id].to_i)
  #
  #   if @task.completed == false
  #     @task.update(completed: true, completion_date: Date.today)
  #   else
  #     @task.update(completed: false, completion_date: nil)
  #   end
  #
  #   redirect_to tasks_path
  # end
  #
  private

  def passenger_params
    return params.require(:passenger).permit(
      :name,
      :phone_num,
    )
  end
end
