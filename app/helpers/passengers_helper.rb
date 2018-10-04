module PassengersHelper
  RATES = [1, 2, 3, 4, 5]

  def rate_me(trip)
    if trip.rating.present?
      trip.rating
    else
      form_with(url: trip_rate_path(trip)) do |f|
        (f.select :rating, RATES ) +
        (f.submit 'Rate')
      end
    end
  end
end


# form_with(url: cake_assign_path(cake)) do |f|
#       (f.collection_select :chef_id, Chef.all, :id, :name) +
#       (f.submit 'Assign')
