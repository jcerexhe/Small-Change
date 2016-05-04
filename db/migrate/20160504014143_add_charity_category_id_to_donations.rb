class AddCharityCategoryIdToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :charity_category_id, :integer
  end
end
