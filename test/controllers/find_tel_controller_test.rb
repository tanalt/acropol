require 'test_helper'

class FindTelControllerTest < ActionController::TestCase
  test "should get main" do
    get :main
    assert_response :success
  end

end
