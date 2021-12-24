require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  require "test_helper"

  test 'without data' do 
    tester = Question.new 
    assert_not tester.save 
  end 
    
  test 'corrent data' do
    user = User.new username: "test", password: "test"
    user.save
    q = Question.new user_id: user.id, head: "ab", text: "abcde"
    assert q.save 
  end 
  
  test 'non-full data' do 
    tester = Question.new text: "abcd"
    assert_not tester.save 
  end 

  test 'duplicate data' do 
    user = User.new username: "test", password: "test"
    user.save
    q1 = Question.new user_id: user.id, head: "ab", text: "abcde"
    q1.save
    q2 = Question.new user_id: user.id, head: "ab", text: "abcde"
    assert q2.save 
  end
end
