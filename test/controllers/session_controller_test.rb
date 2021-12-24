require "test_helper"


class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get session view" do
    get session_login_url
    assert_response :success
    assert_select 'input[name="login"]'
    assert_select 'input[name="password"]'
  end 
end
