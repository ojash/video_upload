require 'test_helper'

class MomentItemsControllerTest < ActionController::TestCase
  setup do
    @moment_item = moment_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moment_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moment_item" do
    assert_difference('MomentItem.count') do
      post :create, moment_item: { audio: @moment_item.audio, title: @moment_item.title, video: @moment_item.video }
    end

    assert_redirected_to moment_item_path(assigns(:moment_item))
  end

  test "should show moment_item" do
    get :show, id: @moment_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moment_item
    assert_response :success
  end

  test "should update moment_item" do
    patch :update, id: @moment_item, moment_item: { audio: @moment_item.audio, title: @moment_item.title, video: @moment_item.video }
    assert_redirected_to moment_item_path(assigns(:moment_item))
  end

  test "should destroy moment_item" do
    assert_difference('MomentItem.count', -1) do
      delete :destroy, id: @moment_item
    end

    assert_redirected_to moment_items_path
  end
end
