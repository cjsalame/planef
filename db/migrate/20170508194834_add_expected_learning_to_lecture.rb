class AddExpectedLearningToLecture < ActiveRecord::Migration[5.1]
  def change
    add_reference :lectures, :expected_learning, foreign_key: true
  end
end
