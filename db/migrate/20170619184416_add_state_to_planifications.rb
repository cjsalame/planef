class AddStateToPlanifications < ActiveRecord::Migration[5.1]
  def change
    add_column :planifications, :state, :boolean, default: true
  end
end
