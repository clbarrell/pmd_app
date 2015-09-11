require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:chris)
  end

  test "should be valid" do
    assert @user.valid?
  end
  
  test "name can't be blank" do
    @user.name = "     "
    assert_not @user.valid?
  end
  
  test "email can't be valid" do
    @user.email = "jkls"
    assert_not @user.valid?
  end

  test "initials can't be blank" do
    @user.initials = "     "
    assert_not @user.valid?
  end  
  
  test "admin variable test" do
    @user.admin = false
    assert @user.valid?
    # user has to have T/F for admin value
    @user.admin = ""
    assert_not @user.valid?
  end
  

end
