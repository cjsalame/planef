# SubjectsTeacher Model
class SubjectsTeacher < ApplicationRecord
  belongs_to :subject, optional: true
  belongs_to :user, optional: true
  has_many   :grades_subjects_teachers
  has_many   :grades, through: :grades_subjects_teachers
end
