class PassengersController < ApplicationController

    def index
      @passengers = Passenger.all.order(:id)
    end

    def show
      id = params[:id]
      @passenger = Passenger.find_by(id: id)


      if id == nil
        render :not_found, status: :not_found
      end
    end

    def new
      @passenger = Passenger.new
    end


    def edit
      id = params[:id].to_i
      @passenger = Passenger.find_by(id: id)
    end

    def update
      id = params[:id].to_i
      @passenger = Passenger.find_by(id: id)
      @passenger.update(passenger_params)
      # @task.name = params[:task][:name]
      # @task.description = params[:task][:description]
      # @task.due = params[:task][:due]
      if @passenger.save
        redirect_to passengers_path # go to the index so we can see the book in the list
      else
        render :edit
      end
    end

    def create
      @passenger = Passenger.new(passenger_params)
      # @task = Task.new(name: params[:task][:name], description: params[:task][:description], due: params[:task][:due]) #instantiate a new book
      if @passenger.save # save returns true if the database insert succeeds
        redirect_to passengers_path # go to the index so we can see the book in the list
      else # save failed :(
        render :new # show the new book form view again
      end
    end

    def destroy
      id = params[:id].to_i
      @passenger = Passenger.find_by(id: id)
      if @passenger.destroy
        redirect_to root_path
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

      def passenger_params
        return params.require(:passenger).permit(:name, :phone_num)
      end
end
