class AddCodeToSchools < ActiveRecord::Migration[5.1]
  def change
    add_column :schools, :code, :string
  end
end
