class Lecture < ApplicationRecord
  belongs_to :planification
  composed_of :expected_learning, mapping: %w(description objectives)
end
