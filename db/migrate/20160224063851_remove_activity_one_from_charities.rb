class RemoveActivityOneFromCharities < ActiveRecord::Migration
  def change
    remove_column :charities, :activity_one, :string
  end
end
