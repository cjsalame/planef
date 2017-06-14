class GradesSubjectsTeacher < ApplicationRecord
  validates :grade_id, uniqueness: { scope: :subjects_teacher_id }

  belongs_to :grade
  belongs_to :subjects_teacher
  has_many   :planifications
end
