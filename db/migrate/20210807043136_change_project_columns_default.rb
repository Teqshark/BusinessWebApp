class ChangeProjectColumnsDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :projects, :height, from: 0, to: 200 
    change_column_default :projects, :width, from: 0, to: 200
    change_column_default :projects, :length, from: 0, to: 200
  end
end
