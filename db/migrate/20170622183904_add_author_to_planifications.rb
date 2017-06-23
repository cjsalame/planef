class AddAuthorToPlanifications < ActiveRecord::Migration[5.1]
  def change
    add_column :planifications, :author_id, :integer
    add_column :planifications, :original, :boolean
  end
end
