class AddPlanificationToReviews < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :planification, foreign_key: true
  end
end
