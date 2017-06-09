class RemoveCodeFromExpectedLearnings < ActiveRecord::Migration[5.1]
  def change
    remove_column :expected_learnings, :code, :string
  end
end
