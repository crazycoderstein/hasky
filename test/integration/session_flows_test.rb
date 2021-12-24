require 'test_helper'

class SessionFlowsTest < ActionDispatch::IntegrationTest
  test 'redirect to login' do
    get root_url
    assert_redirected_to controller: :session, action: :login
  end

  test 'incorrect login or password' do
    post session_create_url, params: { login: Faker::Lorem.word, password: Faker::Lorem.word }
    assert_redirected_to controller: :session, action: :login
  end

  test 'root with active session' do
    password = Faker::Lorem.word
    user = User.create(username: Faker::Lorem.word, password: password, password_confirmation: password)
    post session_create_url, params: { login: user.username, password: password }
    assert_redirected_to root_path
  end

  test 'root after signup' do
    username = Faker::Lorem.word
    password = Faker::Lorem.word
    post users_url, params: { user: { username: username, password: password, password_confirmation: password } }
    assert_redirected_to root_path
  end

  test 'logout' do
    password = Faker::Lorem.word
    user = User.create(username: Faker::Lorem.word, password: password, password_confirmation: password)
    post session_create_url, params: { login: user.username, password: password }
    get session_logout_url
    assert_redirected_to controller: :session, action: :login
  end
end