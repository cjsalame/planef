class Lecture < ApplicationRecord
  belongs_to :planification
  has_one :expected_learning
end
