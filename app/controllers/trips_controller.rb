class TripsController < ApplicationController

  def index
    @trips = Trip.all.order(:id)
  end

  def show
    id = params[:id]
    @trip = Trip.find_by(id: id)


    if id == nil
      render :not_found, status: :not_found
    end
  end

  def homepage
  end

  def new
    @trip = Trip.new
  end

  def edit
    id = params[:id].to_i
    @trip = Trip.find_by(id: id)
  end

  def update
    id = params[:id].to_i
    @trip = Trip.find_by(id: id)
    @trip.update(task_params)
    # @task.name = params[:task][:name]
    # @task.description = params[:task][:description]
    # @task.due = params[:task][:due]
    if @trip.save
      redirect_to trips_path # go to the index so we can see the book in the list
    else
      render :new
    end
  end

  def create
    id = params[:passenger_id].to_i
    @passenger = Passenger.find_by(id: id)
    @passenger.assign_trip
      redirect_to passenger_path(@passenger.id)
  end

  def destroy
    id = params[:id].to_i
    @trip = Trip.find_by(id: id)
    if @trip.destroy
      redirect_to trips_path
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

    def trip_params
      return params.require(:trip).permit(:date ,:rating ,:cost, :passenger_id, :driver_id)
    end
end
