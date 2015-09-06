require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  def setup
    @client = clients(:abs)
  end

  test "should be valid" do
    assert @client.valid?
  end
  
  test "name can't be blank" do
    @client.name = "     "
    assert_not @client.valid?
    @client.name = "a" * 201
    assert_not @client.valid?
  end
  
  test "name can't be invalid" do
    @client.name = nil
    assert_not @client.valid?
  end


end
