# require "test_helper"

# class UsersControllerTest < ActionDispatch::IntegrationTest
  
#   setup do
#     #@user = users(:one)
#     @user = User.new(username: "abcd", password: "abcd", password_digest: "abcd")
#     @user.save 

#   end

#   test "should get new view" do
#     get users_new_url
#     assert_response :success
#     assert_select 'input[name="user[username]"]'
#     assert_select 'input[name="user[password]"]'
#     assert_select 'input[name="user[password_confirmation]"]'
#   end 
   

#   test "should create user" do
#       post session_create_path, params: { username: "abcd", password: "abcd" }
#       get root_path
#       assert_response :success
    
#     #assert_difference('User.count') do
#     #  post users_url, params: { user: { last_login: @user.last_login, password_digest: @user.password_digest, username: @user.username } }
#     #end
#     #assert_redirected_to user_url(User.last)
#   end

#   # test "should show user" do
#   #   get user_url(@user)
#   #   assert_response :success
#   # end

#   # test "should get edit" do
#   #   get edit_user_url(@user)
#   #   assert_response :success
#   # end

#   # test "should update user" do
#   #   patch user_url(@user), params: { user: { last_login: @user.last_login, password_digest: @user.password_digest, username: @user.username } }
#   #   assert_redirected_to user_url(@user)
#   # end

#   # test "should destroy user" do
#   #   assert_difference('User.count', -1) do
#   #     delete user_url(@user)
#   #   end

#   #   assert_redirected_to users_url
#   # end
# end
