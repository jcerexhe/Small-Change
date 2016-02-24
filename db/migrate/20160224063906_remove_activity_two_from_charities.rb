class RemoveActivityTwoFromCharities < ActiveRecord::Migration
  def change
    remove_column :charities, :activity_two, :string
  end
end
