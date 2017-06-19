# Search Model
class Search < ApplicationRecord
  def search_plans
    plans = Planification.all
    plans = plans.where(['name LIKE ?', "%#{keywords}%"]) if keywords.present?
    plans = plans.where(['grades_subjects_teacher.subjects_teacher.subject.name LIKE ?', "%#{subject}%"]) if subject.present?
    plans = plans.where(['school LIKE ?', "%#{school}%"]) if school.present?
    plans = plans.where(['grade LIKE ?', "%#{grade}%"]) if grade.present?

    plans
  end
end
