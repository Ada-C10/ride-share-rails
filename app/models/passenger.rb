class Passenger < ApplicationRecord
  # QUESTION: BETTER TO NULLIFY OR DELETE??
  has_many :trips, dependent: :nullify

  validates :name, presence: true
  validates :phone_num, presence: true

  def total_spent(id)
    # TODO: make it an enumrable
    sum = 0

    user_trips = self.trips.where(passenger_id: id)

    user_trips.each do |trip|
      sum += trip.cost
    end

    return sum
  end

  def generate_trips(id)
    # TODO: code below is repeated twice; make DRY!
    user_trips = self.trips.where(passenger_id: id)
    return user_trips
  end

	# books_with_year = self.books.where.not(publication_date: nil)
	# books_With_year.order(publication_date: :asc).first #sorts in the db
	# return first_book.publication_date


end
