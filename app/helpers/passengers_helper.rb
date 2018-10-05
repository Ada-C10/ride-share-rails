module PassengersHelper
  RATES = [1, 2, 3, 4, 5]

  def rate_me(trip)
    if trip.rating.present?
      trip.rating
    else
      form_with(model: @trip, method: :patch) do |f|
        (f.select :rating, RATES ) +
        (f.submit 'Rate')
      end
    end
  end
end
