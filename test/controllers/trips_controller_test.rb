require "test_helper"

describe TripsController do
  it "should get index" do
    get trips_index_url
    value(response).must_be :success?
  end

end
