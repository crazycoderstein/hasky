require "test_helper"

class UserTest < ActiveSupport::TestCase
  require "test_helper"

  test 'without data' do 
    tester = User.new 
    assert_not tester.save 
  end 
    
  test 'correct data' do
    user = User.new username: "test", password: "test"
    user.save
    assert user.save 
  end 
  
  test 'non-full data' do 
    user = User.new username: "test"
    assert_not user.save 
  end 

  test 'duplicate data' do 
    user1 = User.new username: "test", password: "test"
    user1.save
    user2 = User.new username: "test", password: "test"
    assert_not user2.save 
  end
end
