require 'test_helper'

class ContactsControllerTest < ActionController::TestCase

  def setup
    @user = users(:chris)
    @contact = contacts(:john)
  end

  test "should get new" do
    sign_in @user
    get :new
    assert_response :success
  end

  test "should get show" do
    sign_in @user
    get :show, id: @contact
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get :edit, id: @contact
    assert_response :success
  end

  test "should get index" do
    sign_in @user
    get :index
    assert_response :success
  end

end
