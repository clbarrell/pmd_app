require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 1
    assert_select "a[href=?]", help_path, count: 2
    assert_select "a[href=?]", new_user_registration_path
    assert_select "a[href=?]", new_user_session_path
  end
  
  test "Layout for loggedin users" do
    
  end

end
