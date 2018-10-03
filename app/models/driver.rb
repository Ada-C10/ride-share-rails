class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :vin, presence: true



  def first_published
    books_with_year = self.books.where.not(pub_date: nil)
    first_book = books_with_year.order(pub_date: :asc).first
    return first_book ? first_book.pub_date : nil
  end



  def average_rating
    #self is same thing as driver instance, since we are in model
    sum = 0
    self.trips.each do |trip|
      sum = sum + trip.rating
    end
    length = self.trips.length

    if length == 0
      return 0
    end

    average = sum / length
    return average



    # driver = Driver.find(driver_id)


    # drivers.each do |driver|
    #   average_rating = driver.trips.rating.sum / driver.trips
    #   return average_rating
    # end
  end

end
