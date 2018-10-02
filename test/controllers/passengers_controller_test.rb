require "test_helper"

describe PassengersController do
  it "should get index" do
    get passengers_index_url
    value(response).must_be :success?
  end

end
