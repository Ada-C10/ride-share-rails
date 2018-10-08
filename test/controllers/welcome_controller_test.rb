require "test_helper"

describe WelcomeController do
<<<<<<< HEAD
  # it "must be a real test" do
  #   flunk "Need real tests"
  # end
=======
  it "should get index" do
    get welcome_index_url
    value(response).must_be :success?
  end

>>>>>>> b35586e3a547d6b0f5bdb64dd0bf58a54bf81aa2
end
