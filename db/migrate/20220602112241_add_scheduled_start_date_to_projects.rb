class AddScheduledStartDateToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :scheduled_start_date, :date
    add_column :projects, :scheduled_completion_date, :date
  end
end
