require "test_helper"

describe TripsController do
  it "should get show" do
    get trips_show_url
    value(response).must_be :success?
  end

  it "should get index" do
    get trips_index_url
    value(response).must_be :success?
  end

  it "should get new" do
    get trips_new_url
    value(response).must_be :success?
  end

  it "should get edit" do
    get trips_edit_url
    value(response).must_be :success?
  end

end
