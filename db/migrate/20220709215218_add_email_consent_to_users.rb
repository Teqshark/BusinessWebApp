class AddEmailConsentToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :email_consent, :boolean, default: true
  end
end
