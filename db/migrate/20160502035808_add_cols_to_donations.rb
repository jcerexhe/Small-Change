class AddColsToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :first_name, :string
    add_column :donations, :last_name, :string
    add_column :donations, :phone, :string
    add_column :donations, :submission_url, :string
  end
end
