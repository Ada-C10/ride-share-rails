class PassengersController < ApplicationController


def index
    @passengers = Passenger.all
end

def show
  @passenger = Passenger.find_by(id: params[:id])
  if @passenger.nil?
    head :not_found
  end
end

def new
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
# For params
end
