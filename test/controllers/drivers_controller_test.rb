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

  it "should get edit" do
    get drivers_edit_url
    value(response).must_be :success?
  end

  it "should get create" do
    get drivers_create_url
    value(response).must_be :success?
  end

  it "should get new" do
    get drivers_new_url
    value(response).must_be :success?
  end

  it "should get destroy" do
    get drivers_destroy_url
    value(response).must_be :success?
  end

  it "should get update" do
    get drivers_update_url
    value(response).must_be :success?
  end

end
