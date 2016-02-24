class RemoveChooseCharityLogoFromCharities < ActiveRecord::Migration
  def change
    remove_column :charities, :choose_charity_logo, :string
  end
end
