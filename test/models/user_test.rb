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
  
  test "email can't be invalid" do
    @user.email = "jkls"
    assert_not @user.valid?
  end

  test "initials can't be blank" do
    @user.name = "     "
    assert_not @user.valid?
  end  

end
