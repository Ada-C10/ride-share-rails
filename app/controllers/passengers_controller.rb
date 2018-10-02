class PassengersController < ApplicationController

  def index
    @passengers = Passengers.all
  end

  def edit
  end

  def new
  end

  def destroy
  end

  def create
  end

  def show
  end

  def update
  end

  private

  def book_params
    return params.require(:passenger).permit(
      :name,
      :phone_num,
    )
  end










end
