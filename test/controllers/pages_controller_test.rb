require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

  test "should get appliance" do
    get :appliance
    assert_response :success
  end

  test "should get waste" do
    get :waste
    assert_response :success
  end

  test "should get demolition" do
    get :demolition
    assert_response :success
  end

  test "should get buysell" do
    get :buysell
    assert_response :success
  end

  test "should get service" do
    get :service
    assert_response :success
  end

end
