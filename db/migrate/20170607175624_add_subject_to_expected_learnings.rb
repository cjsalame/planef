class AddSubjectToExpectedLearnings < ActiveRecord::Migration[5.1]
  def change
    add_column :expected_learnings, :subject, :string
  end
end
