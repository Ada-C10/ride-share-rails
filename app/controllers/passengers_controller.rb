class PassengersController < ApplicationController
  def index
    # @passenger = Passenger.all.order(:due_date)
      @passengers = Passenger.all
  end
  #
  # def show
  #   @task = Task.find(params[:id].to_i)
  # end
  #
  # def new
  #   @task= Task.new
  # end
  #
  # def create
  #   @task = Task.new(task_params)
  #
  #   is_successful_save = @task.save
  #
  #   if is_successful_save
  #     redirect_to tasks_path
  #   else
  #     render :new
  #   end
  # end
  #
  # def edit
  #   @task = Task.find_by(id: params[:id])
  #
  #   if !@task
  #     return raise ActiveRecord::RecordNotFound, 'Record not found - cannot edit'
  #   end
  # end
  #
  # def update
  #   @task = Task.find(params[:id])
  #
  #   @task.update(task_params)
  #
  #   redirect_to task_path(@task)
  # end
  #
  # def destroy
  #   @task = Task.find_by(id: params[:id])
  #
  #   if @task
  #     @task.destroy
  #     redirect_to tasks_path
  #   else
  #     return raise ActiveRecord::RecordNotFound, 'Record not found - cannot delete'
  #   end
  # end
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
  # private
  #
  # def task_params
  #   return params.require(:task).permit(
  #     :name,
  #     :description,
  #     :due_date,
  #   )
  # end
end
