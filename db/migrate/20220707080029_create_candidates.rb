class CreateCandidates < ActiveRecord::Migration[6.1]
  def change
    create_table :candidates do |t|
      t.string :position, :null => false
      t.string :name, :null => false
      t.string :phone_number, :null => false
      t.integer :age, :null => false
      t.string :address, :null => false
      t.integer :zip_code, :null => false

      t.timestamps
    end
  end
end
