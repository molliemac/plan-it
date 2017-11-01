class AddEmailToEventUsers < ActiveRecord::Migration
  def change
    add_column :event_users, :email, :string
  end
end
