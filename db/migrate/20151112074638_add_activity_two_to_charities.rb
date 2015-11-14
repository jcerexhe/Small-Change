class AddActivityTwoToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :activity_two, :string
  end
end
