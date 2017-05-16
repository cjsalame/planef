# Planification Model
class Planification < ApplicationRecord
  has_many :lectures, dependent: :destroy
  belongs_to :grades_subjects_teacher
  accepts_nested_attributes_for :lectures
  after_initialize :set_defaults, unless: :persisted?

  def set_defaults
    self.rating ||= 0
    self.downloads ||= 0
  end
end
