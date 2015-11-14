class AddActivityOneToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :activity_one, :string
  end
end
