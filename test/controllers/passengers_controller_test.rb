require "test_helper"

describe PassengersController do
  it "should get index" do
    get passengers_index_url
    value(response).must_be :success?
  end

  it "should get show" do
    get passengers_show_url
    value(response).must_be :success?
  end

  it "should get edit" do
    get passengers_edit_url
    value(response).must_be :success?
  end

  it "should get destroyupdate" do
    get passengers_destroyupdate_url
    value(response).must_be :success?
  end

  it "should get new" do
    get passengers_new_url
    value(response).must_be :success?
  end

  it "should get create" do
    get passengers_create_url
    value(response).must_be :success?
  end

end
