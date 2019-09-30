class CreateLectures < ActiveRecord::Migration[5.1]
  def change
    create_table :lectures do |t|
      t.text :objectives
      t.text :starting
      t.text :developing
      t.text :finalizing
      t.text :content
      t.text :resources
      t.text :duration
      t.text :evaluation
      t.references :planification, foreign_key: true

      t.timestamps
    end
  end
end
