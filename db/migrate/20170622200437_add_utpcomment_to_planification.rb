class AddUtpcommentToPlanification < ActiveRecord::Migration[5.1]
  def change
    add_column :planifications, :utpcomment, :text
  end
end
