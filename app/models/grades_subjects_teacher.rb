class GradesSubjectsTeacher < ApplicationRecord
  belongs_to :grade
  belongs_to :subjects_teacher
end
