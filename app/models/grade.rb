# Grade Model
class Grade < ApplicationRecord
  has_many   :grades_subjects_teachers
  has_many   :subjects_teachers, through: :grades_subjects_teachers
end
