class AddActivityThreeToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :activity_three, :string
  end
end
