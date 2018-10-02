require "test_helper"

describe DriversController do
  it "should get index" do
    get drivers_index_url
    value(response).must_be :success?
  end

  it "should get show" do
    get drivers_show_url
    value(response).must_be :success?
  end

end
