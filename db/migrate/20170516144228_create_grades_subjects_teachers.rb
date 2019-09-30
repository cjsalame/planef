class CreateGradesSubjectsTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :grades_subjects_teachers do |t|
      t.references :grade, foreign_key: true
      t.references :subjects_teacher, foreign_key: true

      t.timestamps
    end
  end
end
