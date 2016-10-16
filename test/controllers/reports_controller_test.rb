require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get sports" do
    get :sports
    assert_response :success
  end

  test "should get hire" do
    get :hire
    assert_response :success
  end

end
