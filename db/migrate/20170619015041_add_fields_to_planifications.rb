class AddFieldsToPlanifications < ActiveRecord::Migration[5.1]
  def change
    add_column :planifications, :subject, :string
    add_column :planifications, :school, :string
    add_column :planifications, :grade, :string
  end
end
