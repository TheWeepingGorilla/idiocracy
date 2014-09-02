class CreateQuestionsResponses < ActiveRecord::Migration
  def change
    create_table :questions_responses do |t|
      t.integer :question_id
      t.integer :response_id
    end
  end
end
