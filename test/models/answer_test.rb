require "test_helper"

class AnswerTest < ActiveSupport::TestCase
  require "test_helper"

  test 'without data' do 
    tester = Answer.new 
    assert_not tester.save 
  end 
    
  test 'correct data' do
    user = User.new username: "test", password: "test"
    user.save
    q = Question.new user_id: user.id, head: "ab", text: "abcde"
    q.save
    tester = Answer.new body: "abcd" , user_id: user.id, question_id: q.id
    assert tester.save 
  end 
  
  test 'non-full data' do 
    tester = Answer.new body: "abcd"
    assert_not tester.save 
  end 

  test 'duplicate data' do 
    user = User.new username: "test", password: "test"
    user.save
    q = Question.new user_id: user.id, head: "ab", text: "abcde"
    q.save
    tester1 = Answer.new body: "abcd" , user_id: user.id, question_id: q.id
    tester1.save

    tester2 = Answer.new body: "abcd" , user_id: user.id, question_id: q.id
    assert tester2.save 
  end
end
