require 'test_helper'

class ContactTest < ActiveSupport::TestCase

  def setup
    @contact = contacts(:john)
  end

  test "should be valid" do
    assert @contact.valid?
  end
  
  test "Testing validity of name" do
    @contact.name = nil
    assert_not @contact.valid?
    @contact.name = "      "
    assert_not @contact.valid?
  end
  

end
