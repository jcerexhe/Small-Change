class RemoveActivityThreeFromCharities < ActiveRecord::Migration
  def change
    remove_column :charities, :activity_three, :string
  end
end
