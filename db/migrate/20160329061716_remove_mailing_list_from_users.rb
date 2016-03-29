class RemoveMailingListFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :mailing_list, :boolean
  end
end
