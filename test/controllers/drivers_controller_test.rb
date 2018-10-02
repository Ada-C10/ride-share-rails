require "test_helper"

describe DriversController do
  it "should get index" do
    get drivers_index_url
    value(response).must_be :success?
  end

end
