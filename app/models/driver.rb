class Driver < ApplicationRecord
  has_many :trips

  def self.next_available
    return Driver.first
  end
end
