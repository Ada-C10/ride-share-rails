module DriversHelper
TRIP_RATING = (1..5).to_a

  def rating(trip)
    if trip.rating.present?
      trip.rating
    else
      form_with(url: trip_assign_rating_path(trip)) do |f|
        (f.collection_select :rating, TRIP_RATING) +
        (f.submit 'Assign Rating')
      end
    end
  end

end
