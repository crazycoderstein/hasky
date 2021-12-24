class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :head
      t.string :text

      t.timestamps
    end
  end
end
