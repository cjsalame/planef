class AddOwnerRefToPlanifications < ActiveRecord::Migration[5.1]
  def change
    add_column :planifications, :owner, :integer
  end
end
