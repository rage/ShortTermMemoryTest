require 'test_helper'

class TestlogsControllerTest < ActionController::TestCase
  setup do
    @testlog = testlogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:testlogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create testlog" do
    assert_difference('Testlog.count') do
      post :create, testlog: { eventtype: @testlog.eventtype, testcase_id: @testlog.testcase_id, timestamp: @testlog.timestamp, value: @testlog.value }
    end

    assert_redirected_to testlog_path(assigns(:testlog))
  end

  test "should show testlog" do
    get :show, id: @testlog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @testlog
    assert_response :success
  end

  test "should update testlog" do
    patch :update, id: @testlog, testlog: { eventtype: @testlog.eventtype, testcase_id: @testlog.testcase_id, timestamp: @testlog.timestamp, value: @testlog.value }
    assert_redirected_to testlog_path(assigns(:testlog))
  end

  test "should destroy testlog" do
    assert_difference('Testlog.count', -1) do
      delete :destroy, id: @testlog
    end

    assert_redirected_to testlogs_path
  end
end
