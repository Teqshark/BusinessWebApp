class AddDesiredStartDateToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :desired_start_date, :date
    add_column :projects, :desired_completion_date, :date
  end
end
