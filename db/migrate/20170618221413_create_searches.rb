class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :subject
      t.string :school
      t.string :grade

      t.timestamps
    end
  end
end
