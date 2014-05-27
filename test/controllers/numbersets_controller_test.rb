require 'test_helper'

class NumbersetsControllerTest < ActionController::TestCase
  setup do
    @numberset = numbersets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:numbersets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create numberset" do
    assert_difference('Numberset.count') do
      post :create, numberset: { length: @numberset.length, list_id: @numberset.list_id, order: @numberset.order, position: @numberset.position }
    end

    assert_redirected_to numberset_path(assigns(:numberset))
  end

  test "should show numberset" do
    get :show, id: @numberset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @numberset
    assert_response :success
  end

  test "should update numberset" do
    patch :update, id: @numberset, numberset: { length: @numberset.length, list_id: @numberset.list_id, order: @numberset.order, position: @numberset.position }
    assert_redirected_to numberset_path(assigns(:numberset))
  end

  test "should destroy numberset" do
    assert_difference('Numberset.count', -1) do
      delete :destroy, id: @numberset
    end

    assert_redirected_to numbersets_path
  end
end
