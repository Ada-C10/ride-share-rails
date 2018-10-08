require "test_helper"

describe TripsController do
  it "should get new" do
    get trips_new_url
    value(response).must_be :success?
  end

  it "should get create" do
    get trips_create_url
    value(response).must_be :success?
  end

  it "should get update" do
    get trips_update_url
    value(response).must_be :success?
  end

  it "should get edestroy" do
    get trips_edestroy_url
    value(response).must_be :success?
  end

  it "should get index" do
    get trips_index_url
    value(response).must_be :success?
  end

  it "should get show" do
    get trips_show_url
    value(response).must_be :success?
  end

end
