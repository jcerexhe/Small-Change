class AddLogoToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :logo, :string
  end
end
