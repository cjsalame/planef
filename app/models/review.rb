# Review Model
class Review < ApplicationRecord
  belongs_to :user
  belongs_to :planification

  validates :planification_id, uniqueness: { scope: :user_id }
end
