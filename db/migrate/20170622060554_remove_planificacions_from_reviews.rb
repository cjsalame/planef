class RemovePlanificacionsFromReviews < ActiveRecord::Migration[5.1]
  def change
    remove_reference :reviews, :planificacion, foreign_key: true
  end
end
