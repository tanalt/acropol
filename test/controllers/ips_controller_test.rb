require 'test_helper'

class IpsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
