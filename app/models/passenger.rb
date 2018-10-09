class Passenger < ApplicationRecord
  validates :name, presence: true, format: { with:/\A\S+\s{1}.+\z/ , message: "Please enter a first and last name."}
  validates :phone_num, presence: true, format: { with: /\A1?\W?\d{3}.\d{3}.\d{4}.?x?\d*\z/, message: "Please enter a valid phone number in (XXX)XXX-XXXX format."}

  has_many :trips, dependent: :nullify

  def total_charges
    sum = 0
    self.trips.each do |trip|
        sum += trip.cost
    end
    sum
  end

  def total_charges_in_dollars
    return "$#{total_charges.to_f / 100}"
  end

end
