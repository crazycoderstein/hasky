# require "test_helper"

# class QuestionsControllerTest < ActionDispatch::IntegrationTest
#     setup do
#         usern = Faker::Lorem.word
#         pass = Faker::Lorem.word
#         post users_url, params: { user: { username: usern, password: pass, password_confirmation: pass } }

#         @user = users(:one)
#         @question = questions(:one)
#         @question_second = questions(:two)
#         @question_second.user = @user
#         @question.user = @user
#     end

#     test "redirect after save" do
#       if @question.save
#         get "http://127.0.0.1:3000/questions/#{@question.id}/edit"
#         assert_response :redirect
#         assert @question.destroy
#       end
#     end 

#     test "should update question no empty data" do
#       assert @question.save
#       if @question.save
#         patch "http://localhost:3000/ru/questions/#{@question.id}/", params:{ question: {head: @question_second.head, text: @question_second.text}}
#         assert_response :redirect
#         assert @question.update head: @question_second.head, text: @question_second.text
#         assert @question.destroy
#       end
#     end
    
# end