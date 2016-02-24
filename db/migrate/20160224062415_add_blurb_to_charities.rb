class AddBlurbToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :blurb, :text
  end
end
