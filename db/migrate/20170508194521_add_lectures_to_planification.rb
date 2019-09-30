class AddLecturesToPlanification < ActiveRecord::Migration[5.1]
  def change
    add_reference :planifications, :lecture, foreign_key: true
  end
end
