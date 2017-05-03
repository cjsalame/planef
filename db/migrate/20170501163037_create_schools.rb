class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :RBD
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
