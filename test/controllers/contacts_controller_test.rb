require 'test_helper'

class ContactsControllerTest < ActionController::TestCase

  def setup
    @user = users(:chris)
    @contact = contacts(:john)
    @client = clients(:abs)
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

  test "shouldn't allow non-signed in ppl" do
    get :index
    assert_redirected_to '/signin'
    get :new
    assert_redirected_to '/signin'
  end

  test "should create contact" do
    sign_in @user
    assert_difference('Contact.count') do
      post :create, contact: {name: 'John Purple', client_id: @client.id}
    end
    assert_redirected_to contacts_path
    assert_equal 'New contact created.', flash[:notice]
  end

  test "should delete contact" do
    sign_in @user
    assert_difference('Contact.count', -1) do
      delete :destroy, id: @contact
    end
    assert_redirected_to contacts_path
    assert_not flash.empty?
  end

  test "should update contact" do
    sign_in @user
    @contact.name = "newn name"
    patch :update, id: @contact.id, contact: { name: @contact.name, client_id: @client.id }
    assert_redirected_to contact_path(assigns(:contact))
    assert_not flash.empty?
  end

end
