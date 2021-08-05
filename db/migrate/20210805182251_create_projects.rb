class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.belongs_to :user, foreign_key: true 
      t.integer :length, :default => 0 
      t.integer :width, :default => 0
      t.integer :height, :default => 0 
      t.string :location, default: ""
      
      t.timestamps null: false 
    end
  end
end
