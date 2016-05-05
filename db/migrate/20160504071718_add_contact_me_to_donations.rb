class AddContactMeToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :contact_me, :boolean
  end
end
