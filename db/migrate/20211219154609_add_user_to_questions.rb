class AddUserToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_reference :questions, :user, null: true, foreign_key: true
  end
end
