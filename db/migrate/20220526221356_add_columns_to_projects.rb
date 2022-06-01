class AddColumnsToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :street_name, :string
    # add_column :projects, :string, :string
    add_column :projects, :city, :string
    # add_column :projects, :string, :string
    add_column :projects, :state, :string
  end
end
