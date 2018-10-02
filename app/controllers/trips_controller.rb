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
      redirect_to trips_root # go to the index so we can see the book in the list
    else
      render :new
    end
  end

  def create
    @trip = Trip.new(trip_params)
    # @task = Task.new(name: params[:task][:name], description: params[:task][:description], due: params[:task][:due]) #instantiate a new book
    if @trip.save # save returns true if the database insert succeeds
      redirect_to trips_root # go to the index so we can see the book in the list
    else # save failed :(
      render :new # show the new book form view again
    end
  end

  def destroy
    id = params[:id].to_i
    @trip = Trip.find_by(id: id)
    if @trip.destroy
      redirect_to trips_root
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
      return params.require(:trip).permit(:date ,:rating ,:cost)
    end
end
