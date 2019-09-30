class AddGradesSubjectTeacherIdToPlanification < ActiveRecord::Migration[5.1]
  def change
    add_column :planifications, :grades_subjects_teacher_id, :integer
  end
end
