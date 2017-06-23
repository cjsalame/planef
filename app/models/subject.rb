# Subject Model
class Subject < ApplicationRecord
  belongs_to :school, optional: true
  has_many :subjects_teachers
  has_many :users, through: :subjects_teachers

  validates :name, uniqueness: { scope: :school_id }
end
