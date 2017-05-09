class CreatePlanifications < ActiveRecord::Migration[5.1]
  def change
    create_table :planifications do |t|
      t.string :name
      t.date :date
      t.integer :rating
      t.integer :downloads

      t.timestamps
    end
  end
end
