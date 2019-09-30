class RemoveSchoolIdFromGrades < ActiveRecord::Migration[5.1]
  def change
    remove_column :grades, :school_id, :integer
  end
end
