class CreateSubjectsTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects_teachers do |t|
      t.references :subject, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
