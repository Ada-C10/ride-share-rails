class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def show
    passenger_id = params[:id]
    @passenger = Passenger.find(passenger_id)
    if @passenger == nil
      head :not_found
    end
  end

  # def new
  #   @book = Book.new
  # end
  #
  # def create
  #   filtered_book_params = book_params()
  #   @book = Book.new(filtered_book_params)
  #
  #   is_successful_save = @book.save
  #
  #   if is_successful_save
  #     redirect_to books_path
  #   else
  #     render :new
  #   end
  # end
  #
  # def edit
  #   @book = Book.find_by(id: params[:id])
  # end
  #
  # def update
  #   book = Book.find(params[:id])
  #   book.update(book_params)
  #
  #   redirect_to book_path(book.id)
  # end
  #
  # def destroy
  #   book = Book.find_by(id: params[:id])
  #
  #   book.destroy
  #   redirect_to books_path
  # end
  #
  # private
  # #
  # # # Strong params: only let certain attributes
  # # # through
  # def passenger_params
  #   return params.require(:passenger).permit(
  #     :title,
  #     :author,
  #     :description,
  #     :isbn
  #   )
  # end
end
