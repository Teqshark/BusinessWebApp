require "test_helper"

class CareersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get careers_new_url
    assert_response :success
  end
end
