class CreateExpectedLearnings < ActiveRecord::Migration[5.1]
  def change
    create_table :expected_learnings do |t|
      t.string :code
      t.string :grade
      t.text :description

      t.timestamps
    end
  end
end
