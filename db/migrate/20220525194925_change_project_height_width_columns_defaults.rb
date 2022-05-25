class ChangeProjectHeightWidthColumnsDefaults < ActiveRecord::Migration[6.1]
  def change
    change_column_default :projects, :height, from: 200, to: 8 
    change_column_default :projects, :width, from: 200, to: 12
    change_column_default :projects, :length, from: 200, to: 100
  end
end
