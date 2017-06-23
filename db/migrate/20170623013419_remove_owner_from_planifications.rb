class RemoveOwnerFromPlanifications < ActiveRecord::Migration[5.1]
  def change
    remove_column :planifications, :owner, :string
  end
end
