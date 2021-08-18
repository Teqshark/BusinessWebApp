class AddZipCodeToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :zip_code, :integer, :default => 71901
  end
end
