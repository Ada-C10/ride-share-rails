class Trip < ApplicationRecord
  # relation to passengers and drivers
  belongs_to :passenger
  belongs_to :driver

  # date must be present
  validates :date, presence: true

  # passenger_id must be present
  validates :passenger_id, presence: true

  # driver_id must be present
  validates :driver_id, presence: true

  # cost must be present and numerical
  validates :cost, presence: true, numericality: true

  def end_trip(params)
    params[:in_progress] = false
    if cost == 0
      params[:cost] = rand(999)
    end

    return params
  end
end
