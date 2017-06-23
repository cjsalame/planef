class AddOwnerToPlanifications < ActiveRecord::Migration[5.1]
  def change
    add_column :planifications, :owner, :string
  end
end
