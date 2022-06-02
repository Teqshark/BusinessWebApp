class AddAdminToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :admin, false
  end
end
