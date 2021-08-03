class AddNamePhoneNumberToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string, null: false, default: ""
    add_column :users, :last_name, :string, null: false, default: ""
    add_column :users, :phone_number, :string, null: false, default: ""
    add_column :users, :admin, :boolean, default: false
  end

  #    t.string :email,              null: false, default: ""
end
