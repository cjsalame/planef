# SubjectsTeacher Model
class SubjectsTeacher < ApplicationRecord
  validates :user_id, uniqueness: { scope: :subject_id }
  belongs_to :subject
  belongs_to :user
  has_many   :grades_subjects_teachers
  has_many   :grades, through: :grades_subjects_teachers
end
